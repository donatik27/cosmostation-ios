//
//  SelectChainCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/25.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import SkeletonView

class SelectChainCell: UITableViewCell {
    
    @IBOutlet weak var rootView: FixCardView!
    @IBOutlet weak var logoImg1: UIImageView!
    @IBOutlet weak var logoImg2: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hdPathLabel: UILabel!
    @IBOutlet weak var legacyTag: UILabel!
    @IBOutlet weak var evmCompatTag: UILabel!
    @IBOutlet weak var cosmosTag: UILabel!
    @IBOutlet weak var keyTypeTag: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var assetCntLabel: UILabel!
    @IBOutlet weak var loadingLabel1: UILabel!
    @IBOutlet weak var loadingLabel2: UILabel!
    @IBOutlet weak var reposeErrorLabel: UILabel!
    
    
    let skeletonAnimation = SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        loadingLabel1.showAnimatedGradientSkeleton(usingGradient: .init(colors: [.color05, .color04]), animation: skeletonAnimation, transition: .none)
        loadingLabel2.showAnimatedGradientSkeleton(usingGradient: .init(colors: [.color06, .color05]), animation: skeletonAnimation, transition: .none)
    }
    
    override func prepareForReuse() {
        currencyLabel.text = ""
        legacyTag.isHidden = true
        evmCompatTag.isHidden = true
        cosmosTag.isHidden = true
        keyTypeTag.isHidden = true
        currencyLabel.isHidden = true
        valueLabel.isHidden = true
        assetCntLabel.isHidden = true
        loadingLabel1.isHidden = false
        loadingLabel2.isHidden = false
        reposeErrorLabel.isHidden = true
    }
    
    var actionToggle: ((Bool) -> Void)? = nil
    @IBAction func onToggle(_ sender: UISwitch) {
        actionToggle?(sender.isOn)
    }
    
    func bindEvmClassChain(_ account: BaseAccount, _ chain: EvmClass, _ selectedList: [String]) {
        logoImg1.image =  UIImage.init(named: chain.logo1)
        logoImg2.image =  UIImage.init(named: chain.logo2)
        nameLabel.text = chain.name.uppercased()
        
        if (selectedList.contains(chain.tag)) {
            rootView.layer.borderWidth = 1.0
            rootView.layer.borderColor = UIColor.white.cgColor
        } else {
            rootView.layer.borderWidth = 0.5
            rootView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        }
        
//        if (chain.supportCosmos) {
//            cosmosTag.isHidden = false
//        }
        
        if (account.type == .withMnemonic) {
            hdPathLabel.text = chain.getHDPath(account.lastHDPath)
        } else {
            hdPathLabel.text = ""
        }
        
        if (chain.fetchState == .Fail) {
            loadingLabel1.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
            loadingLabel1.isHidden = true
            loadingLabel2.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
            loadingLabel2.isHidden = true
            reposeErrorLabel.isHidden = false
            
        } else {
            if let refAddress = BaseData.instance.selectRefAddress(account.id, chain.tag) {
                loadingLabel1.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
                loadingLabel1.isHidden = true
                loadingLabel2.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
                loadingLabel2.isHidden = true
                WDP.dpUSDValue(refAddress.lastUsdValue(), currencyLabel, valueLabel)
                
                let coinCntString = String(refAddress.lastCoinCnt) + " Coins"
                let tokenCnt = chain.mintscanErc20Tokens.filter { $0.getAmount() != NSDecimalNumber.zero }.count
                if (tokenCnt == 0) {
                    assetCntLabel.text = coinCntString
                } else {
                    assetCntLabel.text = String(tokenCnt) + " Tokens,  " + coinCntString
                }
                currencyLabel.isHidden = false
                valueLabel.isHidden = false
                assetCntLabel.isHidden = false
                
            } else {
                loadingLabel1.showAnimatedGradientSkeleton(usingGradient: .init(colors: [.color05, .color04]), animation: skeletonAnimation, transition: .none)
                loadingLabel1.isHidden = false
                loadingLabel2.showAnimatedGradientSkeleton(usingGradient: .init(colors: [.color06, .color05]), animation: skeletonAnimation, transition: .none)
                loadingLabel2.isHidden = false
            }
        }
    }
    
    func bindCosmosClassChain(_ account: BaseAccount, _ chain: CosmosClass, _ selectedList: [String]) {
        logoImg1.image =  UIImage.init(named: chain.logo1)
        logoImg2.image =  UIImage.init(named: chain.logo2)
        nameLabel.text = chain.name.uppercased()
        
        if (selectedList.contains(chain.tag)) {
            rootView.layer.borderWidth = 1.0
            rootView.layer.borderColor = UIColor.white.cgColor
        } else {
            rootView.layer.borderWidth = 0.5
            rootView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        }
        
        if (account.type == .withMnemonic) {
            hdPathLabel.text = chain.getHDPath(account.lastHDPath)
        } else {
            hdPathLabel.text = ""
        }
        
        legacyTag.isHidden = chain.isDefault
        if (chain.tag == "okt996_Keccak") {
            keyTypeTag.text = "ethsecp256k1"
            keyTypeTag.isHidden = false
            
        } else if (chain.tag == "okt996_Secp") {
            keyTypeTag.text = "secp256k1"
            keyTypeTag.isHidden = false
        }
        
        if (chain.fetchState == .Fail) {
            loadingLabel1.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
            loadingLabel1.isHidden = true
            loadingLabel2.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
            loadingLabel2.isHidden = true
            reposeErrorLabel.isHidden = false
            
        } else {
            if let refAddress = BaseData.instance.selectRefAddress(account.id, chain.tag) {
                loadingLabel1.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
                loadingLabel1.isHidden = true
                loadingLabel2.hideSkeleton(reloadDataAfter: true, transition: SkeletonTransitionStyle.none)
                loadingLabel2.isHidden = true
                WDP.dpUSDValue(refAddress.lastUsdValue(), currencyLabel, valueLabel)
                
                let coinCntString = String(refAddress.lastCoinCnt) + " Coins"
                if (chain.supportCw20) {
                    let tokenCnt = chain.mintscanCw20Tokens.filter { $0.getAmount() != NSDecimalNumber.zero }.count
                    if (tokenCnt == 0) {
                        assetCntLabel.text = coinCntString
                    } else {
                        assetCntLabel.text = String(tokenCnt) + " Tokens,  " + coinCntString
                    }
                    
                } else {
                    assetCntLabel.text = coinCntString
                }
                currencyLabel.isHidden = false
                valueLabel.isHidden = false
                assetCntLabel.isHidden = false
                
            } else {
                loadingLabel1.showAnimatedGradientSkeleton(usingGradient: .init(colors: [.color05, .color04]), animation: skeletonAnimation, transition: .none)
                loadingLabel1.isHidden = false
                loadingLabel2.showAnimatedGradientSkeleton(usingGradient: .init(colors: [.color06, .color05]), animation: skeletonAnimation, transition: .none)
                loadingLabel2.isHidden = false
            }
        }
    }
}
