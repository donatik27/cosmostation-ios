//
//  KavaSwap3ViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/08/29.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO

class KavaSwap3ViewController: BaseViewController, PasswordViewDelegate {
    
    @IBOutlet weak var txFeeAmountLabel: UILabel!
    @IBOutlet weak var txFeeDenomLabel: UILabel!
    @IBOutlet weak var swapFeeLabel: UILabel!
    @IBOutlet weak var swapInAmountLabel: UILabel!
    @IBOutlet weak var swapInDenomLabel: UILabel!
    @IBOutlet weak var swapOutAmountLabel: UILabel!
    @IBOutlet weak var swapOutDenomLabel: UILabel!
    @IBOutlet weak var mSlippageLabel: UILabel!
    @IBOutlet weak var mMemoLabel: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnConfirm: UIButton!
    
    var pageHolderVC: StepGenTxViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        self.pageHolderVC = self.parent as? StepGenTxViewController
    }
    
    override func enableUserInteraction() {
        self.onUpdateView()
        self.btnBack.isUserInteractionEnabled = true
        self.btnConfirm.isUserInteractionEnabled = true
    }
    
    func onUpdateView() {
        WUtils.showCoinDp(pageHolderVC.mFee!.amount[0].denom, pageHolderVC.mFee!.amount[0].amount, txFeeDenomLabel, txFeeAmountLabel, chainType!)
        WUtils.showCoinDp(pageHolderVC.mSwapInDenom!, pageHolderVC.mSwapInAmount!.stringValue, swapInDenomLabel, swapInAmountLabel, chainType!)
        WUtils.showCoinDp(pageHolderVC.mSwapOutDenom!, pageHolderVC.mSwapOutAmount!.stringValue, swapOutDenomLabel, swapOutAmountLabel, chainType!)
        let dpSwapFee = NSDecimalNumber.init(string: BaseData.instance.mKavaSwapPoolParam?.swapFee).multiplying(byPowerOf10: -16)
        print("dpSwapFee ", dpSwapFee)
        swapFeeLabel.attributedText = WUtils.displayPercent(dpSwapFee, swapFeeLabel.font)
        mSlippageLabel.attributedText = WUtils.displayPercent(NSDecimalNumber.init(string: "3"), mSlippageLabel.font)
        mMemoLabel.text = pageHolderVC.mMemo
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.btnBack.isUserInteractionEnabled = false
        self.btnConfirm.isUserInteractionEnabled = false
        pageHolderVC.onBeforePage()
    }
    
    @IBAction func onClickConfirm(_ sender: UIButton) {
        let passwordVC = UIStoryboard(name: "Password", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        self.navigationItem.title = ""
        self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
        passwordVC.mTarget = PASSWORD_ACTION_CHECK_TX
        passwordVC.resultDelegate = self
        self.navigationController?.pushViewController(passwordVC, animated: false)
    }
    
    func passwordResponse(result: Int) {
        if (result == PASSWORD_RESUKT_OK) {
            self.onFetchgRPCAuth(account!)
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
            let inCoin = Coin.init(self.pageHolderVC.mSwapInDenom!, self.pageHolderVC.mSwapInAmount!.stringValue)
            let outCoin = Coin.init(self.pageHolderVC.mSwapOutDenom!, self.pageHolderVC.mSwapOutAmount!.stringValue)
            let slippage = "300000000000000000"
            let deadline = (Date().millisecondsSince1970 / 1000) + 300
            let reqTx = Signer.genSignedKavaSwapExactForTokens(auth!,
                                                               self.account!.account_address,
                                                               inCoin,
                                                               outCoin,
                                                               slippage,
                                                               deadline,
                                                               self.pageHolderVC.mFee!, self.pageHolderVC.mMemo!,
                                                               self.pageHolderVC.privateKey!, self.pageHolderVC.publicKey!,
                                                               self.chainType!)
            
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
