//
//  AssetCosmosClassCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/21.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import AlamofireImage

class AssetCosmosClassCell: UITableViewCell {
    
    @IBOutlet weak var rootView: CardViewCell!
    @IBOutlet weak var coinImg: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var priceCurrencyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var priceChangePercentLabel: UILabel!
    @IBOutlet weak var valueCurrencyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var availableTitle: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var vestingLayer: UIView!
    @IBOutlet weak var vestingTitle: UILabel!
    @IBOutlet weak var vestingLabel: UILabel!
    @IBOutlet weak var stakingLayer: UIView!
    @IBOutlet weak var stakingTitle: UILabel!
    @IBOutlet weak var stakingLabel: UILabel!
    @IBOutlet weak var unstakingLayer: UIView!
    @IBOutlet weak var unstakingTitle: UILabel!
    @IBOutlet weak var unstakingLabel: UILabel!
    @IBOutlet weak var rewardLayer: UIView!
    @IBOutlet weak var rewardTitle: UILabel!
    @IBOutlet weak var rewardLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        rootView.setBlur()
    }
    
    override func prepareForReuse() {
        rootView.setBlur()
        coinImg.af.cancelImageRequest()
    }
    
    func bindCosmosStakeAsset(_ baseChain: CosmosClass) {
        if (baseChain is ChainBinanceBeacon) {
            bindBeaconAsset(baseChain)
            
        } else if (baseChain is ChainOkt60Keccak) {
            bindOktAsset(baseChain)
            
        } else if (baseChain is ChainNeutron) {
            bindNeutron(baseChain)
            
        } else {
            let stakeDenom = baseChain.stakeDenom!
            if let msAsset = BaseData.instance.getAsset(baseChain.apiName, stakeDenom) {
                let value = baseChain.denomValue(stakeDenom)
                coinImg.af.setImage(withURL: msAsset.assetImg())
                symbolLabel.text = msAsset.symbol?.uppercased()
                
                WDP.dpPrice(msAsset, priceCurrencyLabel, priceLabel)
                WDP.dpPriceChanged(msAsset, priceChangeLabel, priceChangePercentLabel)
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                
                let availableAmount = baseChain.balanceAmount(stakeDenom).multiplying(byPowerOf10: -msAsset.decimals!)
                availableLabel?.attributedText = WDP.dpAmount(availableAmount.stringValue, availableLabel!.font, 6)
                
                let vestingAmount = baseChain.vestingAmount(stakeDenom).multiplying(byPowerOf10: -msAsset.decimals!)
                if (vestingAmount != NSDecimalNumber.zero) {
                    vestingLayer.isHidden = false
                    vestingLabel?.attributedText = WDP.dpAmount(vestingAmount.stringValue, vestingLabel!.font, 6)
                }
                
                let stakingAmount = baseChain.delegationAmountSum().multiplying(byPowerOf10: -msAsset.decimals!)
                stakingLabel?.attributedText = WDP.dpAmount(stakingAmount.stringValue, stakingLabel!.font, 6)
                
                let unStakingAmount = baseChain.unbondingAmountSum().multiplying(byPowerOf10: -msAsset.decimals!)
                if (unStakingAmount != NSDecimalNumber.zero) {
                    unstakingLayer.isHidden = false
                    unstakingLabel?.attributedText = WDP.dpAmount(unStakingAmount.stringValue, unstakingLabel!.font, 6)
                }
                
                let rewardAmount = baseChain.rewardAmountSum(stakeDenom).multiplying(byPowerOf10: -msAsset.decimals!)
                if (baseChain.rewardAllCoins().count > 0) {
                    rewardLayer.isHidden = false
                    if (baseChain.rewardOtherDenoms() > 0) {
                        rewardTitle.text = "Reward + " + String(baseChain.rewardOtherDenoms())
                    } else {
                        rewardTitle.text = "Reward"
                    }
                    rewardLabel?.attributedText = WDP.dpAmount(rewardAmount.stringValue, rewardLabel!.font, 6)
                }
                
                let totalAmount = availableAmount.adding(vestingAmount).adding(stakingAmount)
                    .adding(unStakingAmount).adding(rewardAmount)
                amountLabel?.attributedText = WDP.dpAmount(totalAmount.stringValue, amountLabel!.font, 6)
            }
        }
        
    }
    
    func bindBeaconAsset(_ baseChain: CosmosClass) {
        if let bnbChain = baseChain as? ChainBinanceBeacon {
            stakingTitle.text = "Locked"
            vestingTitle.text = "Frozen"
            vestingLayer.isHidden = false
            
            let stakeDenom = baseChain.stakeDenom!
            let value = baseChain.allValue()
            coinImg.af.setImage(withURL: ChainBinanceBeacon.assetImg(stakeDenom))
            symbolLabel.text = stakeDenom.uppercased()
            
            WDP.dpPrice(BNB_GECKO_ID, priceCurrencyLabel, priceLabel)
            WDP.dpPriceChanged(BNB_GECKO_ID, priceChangeLabel, priceChangePercentLabel)
            WDP.dpValue(value, valueCurrencyLabel, valueLabel)
            
            let availableAmount = bnbChain.lcdBalanceAmount(stakeDenom)
            availableLabel?.attributedText = WDP.dpAmount(availableAmount.stringValue, availableLabel!.font, 8)
            amountLabel?.attributedText = WDP.dpAmount(availableAmount.stringValue, amountLabel!.font, 8)
        }
    }
    
    func bindOktAsset(_ baseChain: CosmosClass) {
        if let oktChain = baseChain as? ChainOkt60Keccak {
            stakingTitle.text = "Deposited"
            unstakingTitle.text = "Withdrawing"
            
            let stakeDenom = baseChain.stakeDenom!
            let value = baseChain.allValue()
            coinImg.af.setImage(withURL: ChainOkt60Keccak.assetImg(stakeDenom))
            symbolLabel.text = stakeDenom.uppercased()
            
            WDP.dpPrice(OKT_GECKO_ID, priceCurrencyLabel, priceLabel)
            WDP.dpPriceChanged(OKT_GECKO_ID, priceChangeLabel, priceChangePercentLabel)
            WDP.dpValue(value, valueCurrencyLabel, valueLabel)
            
            let availableAmount = oktChain.lcdBalanceAmount(stakeDenom)
            availableLabel?.attributedText = WDP.dpAmount(availableAmount.stringValue, availableLabel!.font, 18)
            
            let depositAmount = oktChain.lcdOktDepositAmount()
            stakingLabel?.attributedText = WDP.dpAmount(depositAmount.stringValue, stakingLabel!.font, 18)
            
            let withdrawAmount = oktChain.lcdOktWithdrawAmount()
            if (withdrawAmount != NSDecimalNumber.zero) {
                unstakingLayer.isHidden = false
                unstakingLabel?.attributedText = WDP.dpAmount(withdrawAmount.stringValue, unstakingLabel!.font, 18)
            }
            
            let totalAmount = availableAmount.adding(depositAmount).adding(withdrawAmount)
            amountLabel?.attributedText = WDP.dpAmount(totalAmount.stringValue, amountLabel!.font, 18)
        }
    }
    
    func bindNeutron(_ baseChain: CosmosClass) {
        if let neutronChain = baseChain as? ChainNeutron {
            stakingTitle.text = "Vault Deposited"
            let stakeDenom = neutronChain.stakeDenom!
            if let msAsset = BaseData.instance.getAsset(neutronChain.apiName, stakeDenom) {
                let value = neutronChain.denomValue(stakeDenom)
                coinImg.af.setImage(withURL: msAsset.assetImg())
                symbolLabel.text = msAsset.symbol?.uppercased()
                
                WDP.dpPrice(msAsset, priceCurrencyLabel, priceLabel)
                WDP.dpPriceChanged(msAsset, priceChangeLabel, priceChangePercentLabel)
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                
                let availableAmount = neutronChain.balanceAmount(stakeDenom).multiplying(byPowerOf10: -msAsset.decimals!)
                availableLabel?.attributedText = WDP.dpAmount(availableAmount.stringValue, availableLabel!.font, 6)
                
                let vestingAmount = neutronChain.neutronVestingAmount().multiplying(byPowerOf10: -msAsset.decimals!)
                if (vestingAmount != NSDecimalNumber.zero) {
                    vestingLayer.isHidden = false
                    vestingLabel?.attributedText = WDP.dpAmount(vestingAmount.stringValue, vestingLabel!.font, 6)
                }
                
                let depositedAmount = neutronChain.neutronDeposited.multiplying(byPowerOf10: -msAsset.decimals!)
                stakingLabel?.attributedText = WDP.dpAmount(depositedAmount.stringValue, stakingLabel!.font, 6)
                
                let totalAmount = availableAmount.adding(vestingAmount).adding(depositedAmount)
                amountLabel?.attributedText = WDP.dpAmount(totalAmount.stringValue, amountLabel!.font, 6)
            }
        }
    }
}
