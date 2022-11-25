//
//  LiquidityUnstakingViewController.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/11/24.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO

class LiquidityUnstakingViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, SBCardPopupDelegate {
    
    
    @IBOutlet weak var inputCoinLayer: CardView!
    @IBOutlet weak var inputCoinImg: UIImageView!
    @IBOutlet weak var inputCoinName: UILabel!
    @IBOutlet weak var inputCoinAmountLabel: UILabel!
    
    @IBOutlet weak var unstakeTableView: UITableView!
    @IBOutlet weak var unstakeEmptyView: UIView!
    
    var pageHolderVC: StrideDappViewController!
    var hostZones = Array<Stride_Stakeibc_HostZone>()
    var dayEpoch: Stride_Stakeibc_EpochTracker?
    var records = Array<Stride_Records_UserRedemptionRecord>()
    var selectedPosition = 0
    var inputCoinDenom: String!
    var availableMaxAmount = NSDecimalNumber.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.unstakeTableView.delegate = self
        self.unstakeTableView.dataSource = self
        self.unstakeTableView.register(UINib(nibName: "UserRecordCell", bundle: nil), forCellReuseIdentifier: "UserRecordCell")
        
        self.inputCoinLayer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onClickInput (_:))))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onStrideFetchDone(_:)), name: Notification.Name("strideFetchDone"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("strideFetchDone"), object: nil)
    }
    
    @objc func onStrideFetchDone(_ notification: NSNotification) {
        self.pageHolderVC = self.parent as? StrideDappViewController
        self.hostZones = pageHolderVC.hostZones
        self.dayEpoch = pageHolderVC.dayEpoch
        self.updateView()
    }
    
    func updateView() {
        self.inputCoinDenom = "st" + hostZones[selectedPosition].hostDenom
        let inputCoinDecimal = WUtils.getDenomDecimal(chainConfig, inputCoinDenom)
        
        WDP.dpSymbol(chainConfig, inputCoinDenom, inputCoinName)
        WDP.dpSymbolImg(chainConfig, inputCoinDenom, inputCoinImg)
        
        availableMaxAmount = BaseData.instance.getAvailableAmount_gRPC(inputCoinDenom!)
        inputCoinAmountLabel.attributedText = WDP.dpAmount(availableMaxAmount.stringValue, inputCoinAmountLabel.font!, inputCoinDecimal, inputCoinDecimal)
        
        onFetchUserHistory()
    }
    
    func updateHistory() {
        self.unstakeTableView.reloadData()
        if (records.count > 0) {
            self.unstakeEmptyView.isHidden = true
        } else {
            self.unstakeEmptyView.isHidden = false
        }
    }
    
    
    @objc func onClickInput (_ sender: UITapGestureRecognizer) {
        let popupVC = SelectPopupViewController(nibName: "SelectPopupViewController", bundle: nil)
        popupVC.type = SELECT_LIQUIDITY_UNSTAKE
        popupVC.hostZones = hostZones
        let cardPopup = SBCardPopupViewController(contentViewController: popupVC)
        cardPopup.resultDelegate = self
        cardPopup.show(onViewController: self)
    }
    
    func SBCardPopupResponse(type: Int, result: Int) {
        self.selectedPosition = result
        self.updateView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"UserRecordCell") as? UserRecordCell
        cell?.bindView(chainConfig, hostZones[selectedPosition], records[indexPath.row], dayEpoch)
        return cell!
    }

    @IBAction func onClickStart(_ sender: UIButton) {
        
    }
    
    func onFetchUserHistory() {
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Stride_Records_QueryAllUserRedemptionRecordForUserRequest.with {
                    $0.address = self.account!.account_address
                    $0.chainID = self.hostZones[self.selectedPosition].chainID
                    $0.limit = 50
                    $0.day = self.dayEpoch!.epochNumber
                }
                if let response = try? Stride_Records_QueryClient(channel: channel).userRedemptionRecordForUser(req, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    self.records = response.userRedemptionRecord
                }
                try channel.close().wait()
                
            } catch {
                print("onFetchUserHistory failed: \(error)")
            }
            DispatchQueue.main.async(execute: { self.updateHistory() });
        }
    }
}
