//
//  MainTabHistoryViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 05/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import SafariServices
import UserNotifications
import web3swift

class MainTabHistoryViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleChainImg: UIImageView!
    @IBOutlet weak var titleWalletName: UILabel!

    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var comingLabel: UILabel!
    
    var mainTabVC: MainTabViewController!
    var refresher: UIRefreshControl!
    var mBnbHistories = Array<BnbHistory>()
    var mOkHistories = Array<OKHistoryHit>()
    var mApiCustomNewHistories = Array<ApiHistoryNewCustom>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTabVC = (self.parent)?.parent as? MainTabViewController
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.historyTableView.delegate = self
        self.historyTableView.dataSource = self
        self.historyTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.historyTableView.register(UINib(nibName: "WalletAddressCell", bundle: nil), forCellReuseIdentifier: "WalletAddressCell")
        self.historyTableView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
        self.historyTableView.register(UINib(nibName: "NewHistoryCell", bundle: nil), forCellReuseIdentifier: "NewHistoryCell")
        self.historyTableView.rowHeight = UITableView.automaticDimension
        self.historyTableView.estimatedRowHeight = UITableView.automaticDimension
        
        if #available(iOS 15.0, *) {
            self.historyTableView.sectionHeaderTopPadding = 0.0
        }
        
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(onRequestFetch), for: .valueChanged)
        self.refresher.tintColor = UIColor(named: "_font05")
        self.historyTableView.addSubview(refresher)
        
        self.onRequestFetch()
        
//        self.emptyLabel.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(testClick(tapGestureRecognizer:)))
//        self.emptyLabel.addGestureRecognizer(tapGesture)
//        historyTableView.isHidden = true
//        emptyLabel.isHidden = false
        
        self.onCheckWeb3()
    }
    
    func onCheckWeb3() {
        print("onCheckWeb3 ")
//        DispatchQueue.global().async {
//            do {
//                let url = URL(string: "rpc-evmos-app.cosmostation.io")
//                let web3 = try await Web3.new(url!)
//                print("web3 ", web3.defaultBlock)
//
//            } catch {
//                print("onCheckWeb3 failed: \(error)")
//            }
//            DispatchQueue.main.async(execute: {
//                print("DispatchQueue")
//            });
//        }
//        DispatchQueue.global().async {
//            let url = URL(string: "https://rpc-evmos-app.cosmostation.io")
//            let web3 = try? Web3.new(url!)
//            print("web3 defaultBlock ", web3?.defaultBlock)
//            print("web3 provider ", web3?.provider)
//            print("web3 provider ", web3?.provider)
//            
//            
//            let ethAddress = EthereumAddress.init(fromHex: "0xa76C7F20740300505FF26280E4b10873556CF4d0")
//            let balance = try? web3?.eth.getBalance(address: ethAddress!)
//            print("balance ", balance)
//            
//            let contractAddress = EthereumAddress.init(fromHex: "0x5842C5532b61aCF3227679a8b1BD0242a41752f2")
//            let erc20token = ERC20(web3: web3!, provider: web3!.provider, address: contractAddress!)
//            let erc20Balance = try? erc20token.getBalance(account: ethAddress!)
//            print("erc20Balance ", erc20Balance)
//
//            DispatchQueue.main.async(execute: {
//                print("DispatchQueue")
//            });
//        }
        
//        let url = URL(string: "https://rpc-evmos-app.cosmostation.io")
//        return try? await Web3.new(url!)
//        let web3 = try? await Web3.new(url!)
//        let web3 = try? await Web3.new(url!) {
//            print("web3 ", web3?.defaultBlock)
//        }
//        print("web3 ", web3?.defaultBlock)
    }
    
    @objc func testClick(tapGestureRecognizer: UITapGestureRecognizer) {
//        let txDetailVC = TxDetailgRPCViewController(nibName: "TxDetailgRPCViewController", bundle: nil)
//        txDetailVC.mIsGen = false
//        txDetailVC.mTxHash = "B8A71DC85201C85CF866BFDAEA39CF47590629FF62FF15E358B985304E6739B2"
//        txDetailVC.hidesBottomBarWhenPushed = true
//        self.navigationItem.title = ""
//        self.navigationController?.pushViewController(txDetailVC, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = "";
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchDone(_:)), name: Notification.Name("onFetchDone"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchPrice(_:)), name: Notification.Name("onFetchPrice"), object: nil)
        self.updateTitle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchDone"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchPrice"), object: nil)
    }
    
    @objc func onFetchDone(_ notification: NSNotification) {
        self.historyTableView.reloadData()
    }
    
    @objc func onFetchPrice(_ notification: NSNotification) {
    }
    
    func updateTitle() {
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.titleChainImg.image = chainConfig?.chainImg
        self.titleWalletName.text = account?.getDpName()
    }
    
    @objc func onRequestFetch() {
        if (chainType == ChainType.BINANCE_MAIN) {
            onFetchBnbHistory(account!.account_address)
        } else if (chainType == ChainType.OKEX_MAIN) {
            onFetchOkHistory(account!.account_address)
        } else {
            onFetchNewApiHistoryCustom(account!.account_address)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) { return 0 }
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CommonHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.headerTitleLabel.text = NSLocalizedString("recent_history", comment: "")
        var cntString = "0"
        if (chainType == ChainType.BINANCE_MAIN) {
            cntString = String(self.mBnbHistories.count)
        } else if (chainType == ChainType.OKEX_MAIN) {
            cntString = String(self.mOkHistories.count)
        } else {
            cntString = String(self.mApiCustomNewHistories.count)
        }
        view.headerCntLabel.text = cntString
        return view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
            
        } else {
            if (chainType == .BINANCE_MAIN) {
                return self.mBnbHistories.count
            } else if (chainType == .OKEX_MAIN) {
                return self.mOkHistories.count
            } else {
                return self.mApiCustomNewHistories.count
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            return onSetAddressItems(tableView, indexPath);
            
        } else {
            if (chainType == .BINANCE_MAIN) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"HistoryCell") as? HistoryCell
                cell?.bindHistoryBnbView(mBnbHistories[indexPath.row], account!.account_address)
                return cell!
                
            } else if (chainType == .OKEX_MAIN) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"HistoryCell") as? HistoryCell
                cell?.bindHistoryOkView(mOkHistories[indexPath.row], account!.account_address)
                return cell!
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier:"NewHistoryCell") as? NewHistoryCell
                cell?.bindHistoryView(chainConfig!, mApiCustomNewHistories[indexPath.row], account!.account_address)
                return cell!
            }
        }
    }
    
    func onSetAddressItems(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"WalletAddressCell") as? WalletAddressCell
        cell?.updateView(account, chainConfig)
        cell?.actionTapAddress = { self.shareAddressType(self.chainConfig, self.account) }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (chainType == ChainType.BINANCE_MAIN) {
            let bnbHistory = mBnbHistories[indexPath.row]
            let link = WUtils.getTxExplorer(chainConfig, bnbHistory.txHash)
            guard let url = URL(string: link) else { return }
            self.onShowSafariWeb(url)
            
        } else if (chainType == ChainType.OKEX_MAIN) {
            let okHistory = mOkHistories[indexPath.row]
            let link = WUtils.getTxExplorer(chainConfig, okHistory.hash!)
            guard let url = URL(string: link) else { return }
            self.onShowSafariWeb(url)
            
        } else {
            let history = mApiCustomNewHistories[indexPath.row]
            let link = WUtils.getTxExplorer(chainConfig, history.data!.txhash!)
            guard let url = URL(string: link) else { return }
            self.onShowSafariWeb(url)
        }
    }
    
    func onFetchBnbHistory(_ address:String) {
        let url = BaseNetWork.accountHistory(chainType!, address)
        let request = Alamofire.request(url, method: .get, parameters: ["address":address, "startTime":Date().Stringmilli3MonthAgo, "endTime":Date().millisecondsSince1970], encoding: URLEncoding.default, headers: [:])
        request.responseJSON { response in
            switch response.result {
            case .success(let res):
                if let data = res as? NSDictionary, let rawHistory = data.object(forKey: "tx") as? Array<NSDictionary> {
                    self.mBnbHistories.removeAll()
                    for raw in rawHistory {
                        self.mBnbHistories.append(BnbHistory.init(raw as! [String : Any]))
                    }
                    if(self.mBnbHistories.count > 0) {
                        self.historyTableView.reloadData()
                        self.emptyLabel.isHidden = true
                    } else {
                        self.emptyLabel.isHidden = false
                    }
                    
                } else {
                    self.emptyLabel.isHidden = false
                }
                
            case .failure(let error):
                print("error ", error)
            }
        }
        self.refresher.endRefreshing()
    }
    
    func onFetchOkHistory(_ address: String) {
        let url = BaseNetWork.accountHistory(chainType!, address)
        let request = Alamofire.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        print("onFetchOkHistory url ", request.request?.url)
        request.responseJSON { response in
            switch response.result {
            case .success(let res):
                self.mOkHistories.removeAll()
                if let histories = res as? NSDictionary, let hits = OkHistory.init(histories).data?.hits {
                    self.mOkHistories = hits
                }
                if (self.mOkHistories.count > 0) {
                    self.historyTableView.reloadData()
                    self.emptyLabel.isHidden = true
                } else {
                    self.emptyLabel.isHidden = false
                }

            case .failure(let error):
                print("error ", error)
            }
        }
        self.refresher.endRefreshing()
    }
    
    func onFetchNewApiHistoryCustom(_ address:String) {
        let url = BaseNetWork.accountHistory(chainType!, address)
        let request = Alamofire.request(url, method: .get, parameters: ["limit":"50"], encoding: URLEncoding.default, headers: [:])
        print("onFetchNewApiHistoryCustom url ", request.request?.url)
        request.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                self.mApiCustomNewHistories.removeAll()
                if let histories = res as? Array<NSDictionary> {
                    for rawHistory in histories {
                        self.mApiCustomNewHistories.append(ApiHistoryNewCustom.init(rawHistory))
                    }
                }
                if (self.mApiCustomNewHistories.count > 0) {
                    self.historyTableView.reloadData()
                    self.emptyLabel.isHidden = true
                } else {
                    self.emptyLabel.isHidden = false
                }

            case .failure(let error):
                self.emptyLabel.isHidden = false
                print("onFetchNewApiHistoryCustom ", error)
            }
            self.refresher.endRefreshing()
        }
    }
    
    
    @IBAction func onClickSwitchAccount(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        self.mainTabVC.onShowAccountSwicth {
            sender.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func onClickExplorer(_ sender: UIButton) {
        let link = WUtils.getAccountExplorer(chainConfig, account!.account_address)
        guard let url = URL(string: link) else { return }
        self.onShowSafariWeb(url)
    }
}
