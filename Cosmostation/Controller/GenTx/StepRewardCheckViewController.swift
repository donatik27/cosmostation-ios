//
//  StepRewardCheckViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 12/04/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import GRPC
import NIO

class StepRewardCheckViewController: BaseViewController, PasswordViewDelegate{
    
    @IBOutlet weak var rewardAmoutLaebl: UILabel!
    @IBOutlet weak var rewardDenomLabel: UILabel!
    @IBOutlet weak var feeAmountLabel: UILabel!
    @IBOutlet weak var feeDenomLabel: UILabel!
    
    @IBOutlet weak var fromValidatorLabel: UILabel!
    @IBOutlet weak var recipientTitleLabel: UILabel!
    @IBOutlet weak var recipientLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    
    @IBOutlet weak var expectedSeparator: UIView!
    @IBOutlet weak var expectedAmountTitle: UILabel!
    @IBOutlet weak var expectedAmountLabel: UILabel!
    @IBOutlet weak var expectedDenomLabel: UILabel!
    
    @IBOutlet weak var beforeBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!

    var pageHolderVC: StepGenTxViewController!
    var mDpDecimal:Int16 = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        self.pageHolderVC = self.parent as? StepGenTxViewController
        WUtils.setDenomTitle(chainType!, rewardDenomLabel)
        WUtils.setDenomTitle(chainType!, feeDenomLabel)
        WUtils.setDenomTitle(chainType!, expectedDenomLabel)
        
    }
    
    @IBAction func onClickConfirm(_ sender: Any) {
        if (checkIsWasteFee()) {
            let disableAlert = UIAlertController(title: NSLocalizedString("fee_over_title", comment: ""), message: NSLocalizedString("fee_over_msg", comment: ""), preferredStyle: .alert)
            disableAlert.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .default, handler: { [weak disableAlert] (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(disableAlert, animated: true) {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
                disableAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
            }
            return
        }

        let passwordVC = UIStoryboard(name: "Password", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        self.navigationItem.title = ""
        self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
        passwordVC.mTarget = PASSWORD_ACTION_CHECK_TX
        passwordVC.resultDelegate = self
        self.navigationController?.pushViewController(passwordVC, animated: false)
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.beforeBtn.isUserInteractionEnabled = false
        self.confirmBtn.isUserInteractionEnabled = false
        pageHolderVC.onBeforePage()
    }
    
    override func enableUserInteraction() {
        self.onUpdateView()
        self.beforeBtn.isUserInteractionEnabled = true
        self.confirmBtn.isUserInteractionEnabled = true
    }

    func checkIsWasteFee() -> Bool {
        var selectedRewardSum = NSDecimalNumber.zero
        for validator in pageHolderVC.mRewardTargetValidators_gRPC {
            let amount = BaseData.instance.getReward_gRPC(WUtils.getMainDenom(chainType), validator.operatorAddress)
            selectedRewardSum = selectedRewardSum.adding(amount)
        }
        if (NSDecimalNumber.init(string: pageHolderVC.mFee?.amount[0].amount).compare(selectedRewardSum).rawValue > 0 ) {
            return true
        }
        return false
    }
    
    func onUpdateView() {
        mDpDecimal = WUtils.mainDivideDecimal(chainType)
        var monikers = ""
        for validator in pageHolderVC.mRewardTargetValidators_gRPC {
            if(monikers.count > 0) {
                monikers = monikers + ",   " + validator.description_p.moniker
            } else {
                monikers = validator.description_p.moniker
            }
        }
        fromValidatorLabel.text = monikers
        memoLabel.text = pageHolderVC.mMemo
        recipientLabel.text = pageHolderVC.mRewardAddress
        recipientLabel.adjustsFontSizeToFitWidth = true
        
        var selectedRewardSum = NSDecimalNumber.zero
        for validator in pageHolderVC.mRewardTargetValidators_gRPC {
            let amount = BaseData.instance.getReward_gRPC(WUtils.getMainDenom(chainType), validator.operatorAddress)
            selectedRewardSum = selectedRewardSum.adding(amount)
        }
        
        rewardAmoutLaebl.attributedText = WUtils.displayAmount2(selectedRewardSum.stringValue, rewardAmoutLaebl.font, mDpDecimal, mDpDecimal)
        feeAmountLabel.attributedText = WUtils.displayAmount2(pageHolderVC.mFee?.amount[0].amount, feeAmountLabel.font, mDpDecimal, mDpDecimal)
        
        let userBalance: NSDecimalNumber = BaseData.instance.getAvailableAmount_gRPC(WUtils.getMainDenom(chainType))
        let expectedAmount = userBalance.adding(selectedRewardSum).subtracting(WUtils.plainStringToDecimal(pageHolderVC.mFee?.amount[0].amount))
        expectedAmountLabel.attributedText = WUtils.displayAmount2(expectedAmount.stringValue, rewardAmoutLaebl.font, mDpDecimal, mDpDecimal)
        
        if (pageHolderVC.mAccount?.account_address == pageHolderVC.mRewardAddress) {
            recipientTitleLabel.isHidden = true
            recipientLabel.isHidden = true
            
            expectedSeparator.isHidden = false
            expectedAmountTitle.isHidden = false
            expectedAmountLabel.isHidden = false
            expectedDenomLabel.isHidden = false
            
        } else {
            recipientTitleLabel.isHidden = false
            recipientLabel.isHidden = false
            
            expectedSeparator.isHidden = true
            expectedAmountTitle.isHidden = true
            expectedAmountLabel.isHidden = true
            expectedDenomLabel.isHidden = true
        }
        
    }
    
    func passwordResponse(result: Int) {
        if (result == PASSWORD_RESUKT_OK) {
            self.onFetchgRPCAuth(pageHolderVC.mAccount!)
        }
    }
    
    func onFetchgRPCAuth(_ account: Account) {
        self.showWaittingAlert()
        DispatchQueue.global().async {
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            let req = Cosmos_Auth_V1beta1_QueryAccountRequest.with {
                $0.address = account.account_address
            }
            do {
                let response = try Cosmos_Auth_V1beta1_QueryClient(channel: channel).account(req).response.wait()
                self.onBroadcastGrpcTx(response)
            } catch {
                print("onFetchgRPCAuth failed: \(error)")
            }
        }
    }
    
    func onBroadcastGrpcTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse?) {
        DispatchQueue.global().async {
            let reqTx = Signer.genSignedClaimRewardsTxgRPC(auth!, self.pageHolderVC.mRewardTargetValidators_gRPC,
                                                           self.pageHolderVC.mFee!, self.pageHolderVC.mMemo!,
                                                           self.pageHolderVC.privateKey!, self.pageHolderVC.publicKey!,
                                                           BaseData.instance.getChainId(self.chainType))
            
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            do {
                let response = try Cosmos_Tx_V1beta1_ServiceClient(channel: channel).broadcastTx(reqTx).response.wait()
//                print("response ", response.txResponse.txhash)
                DispatchQueue.main.async(execute: {
                    if (self.waitAlert != nil) {
                        self.waitAlert?.dismiss(animated: true, completion: {
                            self.onStartTxDetailgRPC(response)
                        })
                    }
                });
            } catch {
                print("onBroadcastGrpcTx failed: \(error)")
            }
        }
    }
}
