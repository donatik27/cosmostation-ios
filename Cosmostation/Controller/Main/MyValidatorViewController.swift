//
//  MyValidatorViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 22/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO
import SwiftKeychainWrapper

class MyValidatorViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myValidatorCnt: UILabel!
    @IBOutlet weak var btnSort: UIView!
    @IBOutlet weak var sortType: UILabel!
    @IBOutlet weak var myValidatorTableView: UITableView!
    
    var mainTabVC: MainTabViewController!
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.myValidatorTableView.delegate = self
        self.myValidatorTableView.dataSource = self
        self.myValidatorTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.myValidatorTableView.register(UINib(nibName: "MyValidatorCell", bundle: nil), forCellReuseIdentifier: "MyValidatorCell")
        self.myValidatorTableView.register(UINib(nibName: "ClaimRewardAllCell", bundle: nil), forCellReuseIdentifier: "ClaimRewardAllCell")
        self.myValidatorTableView.register(UINib(nibName: "PromotionCell", bundle: nil), forCellReuseIdentifier: "PromotionCell")
        self.myValidatorTableView.rowHeight = UITableView.automaticDimension
        self.myValidatorTableView.estimatedRowHeight = UITableView.automaticDimension

        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(onRequestFetch), for: .valueChanged)
        self.refresher.tintColor = UIColor(named: "_font05")
        self.myValidatorTableView.addSubview(refresher)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onStartSort))
        self.btnSort.addGestureRecognizer(tap)
        self.getKey()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mainTabVC = ((self.parent)?.parent)?.parent as? MainTabViewController
        self.balances = BaseData.instance.selectBalanceById(accountId: self.account!.account_id)
        self.onSortingMy()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchDone(_:)), name: Notification.Name("onFetchDone"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchDone"), object: nil)
    }
    
    @objc func onFetchDone(_ notification: NSNotification) {
        self.onSortingMy()
        self.refresher.endRefreshing()
    }
    
    @objc func onSortingMy() {
        self.myValidatorCnt.text = String(BaseData.instance.mMyValidators_gRPC.count)
        if (BaseData.instance.getMyValidatorSort() == 0) {
            self.sortType.text = NSLocalizedString("sort_by_my_delegate", comment: "")
            sortByDelegated()
        } else if (BaseData.instance.getMyValidatorSort() == 1) {
            self.sortType.text = NSLocalizedString("sort_by_name", comment: "")
            sortByName()
        } else {
            self.sortType.text = NSLocalizedString("sort_by_reward", comment: "")
            sortByReward()
        }
        self.myValidatorTableView.reloadData()
    }
    
    @objc func onRequestFetch() {
        if (!mainTabVC.onFetchAccountData()) {
            self.refresher.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (BaseData.instance.mMyValidators_gRPC.count < 1) { return 1; }
        else { return BaseData.instance.mMyValidators_gRPC.count + 1; }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (BaseData.instance.mMyValidators_gRPC.count < 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"PromotionCell") as? PromotionCell
            cell?.cardView.backgroundColor = chainConfig?.chainColorBG
            return cell!
            
        } else {
            if (indexPath.row == BaseData.instance.mMyValidators_gRPC.count) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"ClaimRewardAllCell") as? ClaimRewardAllCell
                cell?.updateView(chainConfig)
                cell?.actionRewardAll = { self.onStartEasyClaim() }
                cell?.actionCompunding = { self.onStartEasyCompunding() }
                return cell!
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier:"MyValidatorCell") as? MyValidatorCell
                cell?.updateView(BaseData.instance.mMyValidators_gRPC[indexPath.row], self.chainConfig)
                return cell!
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (BaseData.instance.mMyValidators_gRPC.count == 0) {
            if let cosmostation = BaseData.instance.mAllValidators_gRPC.filter({ $0.description_p.moniker == "Cosmostation" }).first {
                self.onStartDelegate(cosmostation, nil)
            }
        }
        if (BaseData.instance.mMyValidators_gRPC.count > 0 && indexPath.row != BaseData.instance.mMyValidators_gRPC.count) {
            let validatorDetailVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "VaildatorDetailViewController") as! VaildatorDetailViewController
            validatorDetailVC.mValidator_gRPC = BaseData.instance.mMyValidators_gRPC[indexPath.row]
            validatorDetailVC.hidesBottomBarWhenPushed = true
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(validatorDetailVC, animated: true)
        }
    }
    
    func onStartEasyClaim() {
        print("onStartEasyClaim")
        if (!self.account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        if (!BaseData.instance.isTxFeePayable(chainConfig)) {
            self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
            return
        }
        let toClaimRewards = getClaimableReward()
        if (toClaimRewards.count <= 0) {
            self.onShowToast(NSLocalizedString("error_not_enough_reward", comment: ""))
            return
        }
        print("toClaimRewards ", toClaimRewards)
        var toClaimValAddresses = Array<String>()
        toClaimRewards.forEach { toClaimRewards in
            toClaimValAddresses.append(toClaimRewards.validatorAddress)
        }
        
        self.showWaittingAlert()
        
        var mFeeGasAmount = NSDecimalNumber.init(string: "500000")
        let mFeeInfo = WUtils.getFeeInfos(chainConfig)
        //user option
        let mFeeData = mFeeInfo[chainConfig!.getGasDefault()].FeeDatas[0]
        var mFee: Fee!
        var mFeeCoin: Coin!
        if (chainType == .SIF_MAIN) {
            mFeeCoin = Coin.init(mFeeData.denom!, "100000000000000000")
        } else {
            let amount = (mFeeData.gasRate)!.multiplying(by: mFeeGasAmount, withBehavior: WUtils.handler0Up)
            mFeeCoin = Coin.init(mFeeData.denom!, amount.stringValue)
        }
        mFee = Fee.init(mFeeGasAmount.stringValue, [mFeeCoin])
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let authReq = Cosmos_Auth_V1beta1_QueryAccountRequest.with { $0.address = self.account!.account_address }
                if let authRes = try? Cosmos_Auth_V1beta1_QueryClient(channel: channel).account(authReq, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    let simulReq = Signer.genSimulateClaimRewardsTxgRPC(authRes, toClaimValAddresses, mFee, "", self.privateKey!, self.privateKey!, self.chainType!)
                    if let simulRes = try? Cosmos_Tx_V1beta1_ServiceClient(channel: channel).simulate(simulReq, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                        mFeeGasAmount = NSDecimalNumber.init(value: simulRes.gasInfo.gasUsed).multiplying(by: NSDecimalNumber.init(value: 1.1), withBehavior: WUtils.handler0Up)
                        print("mFeeGasAmount ", mFeeGasAmount)
                        if (self.chainType != .SIF_MAIN) {
                            let amount = (mFeeData.gasRate)!.multiplying(by: mFeeGasAmount, withBehavior: WUtils.handler0Up)
                            mFeeCoin = Coin.init(mFeeData.denom!, amount.stringValue)
                        }
                        mFee = Fee.init(mFeeGasAmount.stringValue, [mFeeCoin])
                        print("mFee ", mFee)
//
//                        let txReq = Signer.genSignedClaimRewardsTxgRPC(authRes, toClaimValAddresses, mFee, "",  self.privateKey!, self.privateKey!, self.chainType!)
//                        if let txRes = try? Cosmos_Tx_V1beta1_ServiceClient(channel: channel).broadcastTx(txReq, callOptions: BaseNetWork.getCallOptions()).response.wait() {
//                            DispatchQueue.main.async(execute: {
//                                if (self.waitAlert != nil) {
//                                    self.waitAlert?.dismiss(animated: true, completion: {
//                                        self.onStartTxDetailgRPC(txRes)
//                                    })
//                                }
//                            });
//                        }
                    }
                }
                try channel.close().wait()
                
            } catch {
                print("onStartEasyClaim failed: \(error)")
            }
        }
        
    }
    
    func onStartEasyCompunding() {
        print("onStartEasyCompunding")
        
    }
    
    /*
    func didTapClaimAll(_ sender: UIButton) {
        if (!self.account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        var claimAbleValidators = Array<Cosmos_Staking_V1beta1_Validator>()
        var toClaimValidators  = Array<Cosmos_Staking_V1beta1_Validator>()
        let mainDenom = chainConfig!.stakeDenom
        
        BaseData.instance.mMyValidators_gRPC.forEach { validator in
            if (BaseData.instance.getReward_gRPC(mainDenom, validator.operatorAddress).compare(NSDecimalNumber.init(string: "0.001")).rawValue > 0) {
                claimAbleValidators.append(validator)
            }
        }
        if (claimAbleValidators.count == 0) {
            self.onShowToast(NSLocalizedString("error_not_enough_reward", comment: ""))
            return;
        }
        claimAbleValidators.sort {
            let reward0 = BaseData.instance.getReward_gRPC(mainDenom, $0.operatorAddress)
            let reward1 = BaseData.instance.getReward_gRPC(mainDenom, $1.operatorAddress)
            return reward0.compare(reward1).rawValue > 0 ? true : false
        }
        if (claimAbleValidators.count > 16) {
            toClaimValidators = Array(claimAbleValidators[0..<16])
        } else {
            toClaimValidators = claimAbleValidators
        }
        
        if (!BaseData.instance.isTxFeePayable(chainConfig)) {
            self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
            return
        }
        
        let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        txVC.mRewardTargetValidators_gRPC = toClaimValidators
        txVC.mType = TASK_TYPE_CLAIM_STAKE_REWARD
        txVC.hidesBottomBarWhenPushed = true
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(txVC, animated: true)
    }
    */
    
    func onStartDelegate(_ validator_gRPC: Cosmos_Staking_V1beta1_Validator?, _ validator: Validator?) {
        if (!account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        
        if (!BaseData.instance.isTxFeePayable(chainConfig)) {
            self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
            return
        }
        if (BaseData.instance.getDelegatable_gRPC(chainConfig).compare(NSDecimalNumber.zero).rawValue <= 0) {
            self.onShowToast(NSLocalizedString("error_not_enough_available", comment: ""))
            return
        }
        
        let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        txVC.mType = TASK_TYPE_DELEGATE
        txVC.mTargetValidator_gRPC = validator_gRPC
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(txVC, animated: true)
    }
    
    @objc func onStartSort() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if #available(iOS 13.0, *) { alert.overrideUserInterfaceStyle = BaseData.instance.getThemeType() }
        alert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("sort_by_name", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            BaseData.instance.setMyValidatorSort(1)
            self.onSortingMy()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("sort_by_my_delegate", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            BaseData.instance.setMyValidatorSort(0)
            self.onSortingMy()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("sort_by_reward", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            BaseData.instance.setMyValidatorSort(2)
            self.onSortingMy()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func sortByName() {
        BaseData.instance.mMyValidators_gRPC.sort{
            if ($0.description_p.moniker == "Cosmostation") { return true }
            if ($1.description_p.moniker == "Cosmostation") { return false }
            if ($0.jailed && !$1.jailed) { return false }
            if (!$0.jailed && $1.jailed) { return true }
            return $0.description_p.moniker < $1.description_p.moniker
        }
    }
    
    func sortByDelegated() {
        BaseData.instance.mMyValidators_gRPC.sort {
            if ($0.description_p.moniker == "Cosmostation") { return true }
            if ($1.description_p.moniker == "Cosmostation") { return false }
            if ($0.jailed && !$1.jailed) { return false }
            if (!$0.jailed && $1.jailed) { return true }
            let firstVal = BaseData.instance.getDelegated_gRPC($0.operatorAddress)
            let seconVal = BaseData.instance.getDelegated_gRPC($1.operatorAddress)
            return firstVal.compare(seconVal).rawValue > 0 ? true : false
        }
    }
    
    func sortByReward() {
        BaseData.instance.mMyValidators_gRPC.sort {
            if ($0.description_p.moniker == "Cosmostation") { return true }
            if ($1.description_p.moniker == "Cosmostation") { return false }
            if ($0.jailed && !$1.jailed) { return false }
            if (!$0.jailed && $1.jailed) { return true }
            let firstVal = BaseData.instance.getReward_gRPC(WUtils.getMainDenom(self.chainConfig), $0.operatorAddress)
            let seconVal = BaseData.instance.getReward_gRPC(WUtils.getMainDenom(self.chainConfig), $1.operatorAddress)
            return firstVal.compare(seconVal).rawValue > 0 ? true : false
        }
    }
    
    func getClaimableReward() -> Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward> {
        let soreted = BaseData.instance.mMyReward_gRPC.sorted {
            let firstCoin = $0.reward.filter({ $0.denom == chainConfig?.stakeDenom }).first
            let secondCoin = $1.reward.filter({ $0.denom == chainConfig?.stakeDenom }).first
            let firstAmount = NSDecimalNumber.init(string: firstCoin?.amount)
            let secondAmount = NSDecimalNumber.init(string: secondCoin?.amount)
            return firstAmount.compare(secondAmount).rawValue > 0 ? true : false
        }
        var result = Array<Cosmos_Distribution_V1beta1_DelegationDelegatorReward>()
        soreted.forEach { rawReward in
            if let stakeCoin = rawReward.reward.filter({ $0.denom == chainConfig?.stakeDenom }).first {
                let divideDecimal = WUtils.getDenomDecimal(chainConfig, stakeCoin.denom)
                var rewardAmount = NSDecimalNumber.init(string: stakeCoin.amount)
                rewardAmount = rewardAmount.multiplying(byPowerOf10: -18).multiplying(byPowerOf10: -divideDecimal)
                if (rewardAmount.compare(NSDecimalNumber.init(string: "0.01")).rawValue > 0) {
                    result.append(rawReward)
                }
            }
        }
        if (result.count > 10) {
            result = Array(result[0..<10])
        }
        return result
    }
    
    var privateKey: Data?
    var publicKey: Data?
    func getKey() {
        DispatchQueue.global().async {
            if (BaseData.instance.getUsingEnginerMode()) {
                if (self.account?.account_from_mnemonic == true) {
                    if let words = KeychainWrapper.standard.string(forKey: self.account!.account_uuid.sha1())?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
                        self.privateKey = KeyFac.getPrivateRaw(words, self.account!)
                        self.publicKey = KeyFac.getPublicFromPrivateKey(self.privateKey!)
                    }
                    
                } else {
                    if let key = KeychainWrapper.standard.string(forKey: self.account!.getPrivateKeySha1()) {
                        self.privateKey = KeyFac.getPrivateFromString(key)
                        self.publicKey = KeyFac.getPublicFromPrivateKey(self.privateKey!)
                    }
                }
                
            } else {
                //Speed up for get privatekey with non-enginerMode
                if let key = KeychainWrapper.standard.string(forKey: self.account!.getPrivateKeySha1()) {
                    self.privateKey = KeyFac.getPrivateFromString(key)
                    self.publicKey = KeyFac.getPublicFromPrivateKey(self.privateKey!)
                }
            }
        }
    }
}
