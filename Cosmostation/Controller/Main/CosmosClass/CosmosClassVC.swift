//
//  CosmosClassVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/21.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import MaterialComponents

class CosmosClassVC: BaseVC {
    
    @IBOutlet weak var tabbar: MDCTabBarView!
    @IBOutlet weak var assetList: UIView!
    @IBOutlet weak var historyList: UIView!
    
    var selectedPosition: Int!
    var nativeCoins = Array<Cosmos_Base_V1beta1_Coin>()                // section 1
    var ibcCoins = Array<Cosmos_Base_V1beta1_Coin>()                   // section 2
    var bridgedCoins = Array<Cosmos_Base_V1beta1_Coin>()               // section 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onSetTabbarView()
    }
    
    func onSetTabbarView() {
        let coinTabBar = UITabBarItem(title: "Coins", image: nil, tag: 0)
        let historyTabBar = UITabBarItem(title: "Histories", image: nil, tag: 1)
        tabbar.items = [ coinTabBar, historyTabBar]
        tabbar.barTintColor = .clear
        tabbar.selectionIndicatorStrokeColor = .white
        tabbar.setTitleFont(.fontSize14Bold, for: .normal)
        tabbar.setTitleFont(.fontSize14Bold, for: .selected)
        tabbar.setTitleColor(.fontColor02, for: .normal)
        tabbar.setTitleColor(.fontColor01, for: .selected)
        tabbar.setSelectedItem(coinTabBar, animated: false)
        tabbar.tabBarDelegate = self
        tabbar.preferredLayoutStyle = .fixedClusteredLeading
        
        assetList.alpha = 1
        historyList.alpha = 0
    }
    
    


}

//extension CosmosClassVC: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (selectedTab == .assets) {
//
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if (selectedTab == .assets) {
//            if (indexPath.row == 0) {
//                let cell = tableView.dequeueReusableCell(withIdentifier:"AssetCosmosClassCell") as! AssetCosmosClassCell
//                return cell
//            }
//            let cell = tableView.dequeueReusableCell(withIdentifier:"AssetCell") as! AssetCell
//            return cell
//
//        } else {
//
//        }
//        return UITableViewCell()
//    }
//
//
//}

extension CosmosClassVC: MDCTabBarViewDelegate {
    func tabBarView(_ tabBarView: MDCTabBarView, didSelect item: UITabBarItem) {
        if (item.tag == 0) {
            assetList.alpha = 1
            historyList.alpha = 0
            
        } else if (item.tag == 1) {
            assetList.alpha = 0
            historyList.alpha = 1
        }
    }
}
