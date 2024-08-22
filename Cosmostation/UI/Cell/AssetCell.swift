//
//  AssetCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/21.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON

class AssetCell: UITableViewCell {
    
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
    @IBOutlet weak var hidenValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        amountLabel.text = ""
        valueCurrencyLabel.text = ""
        valueLabel.text = ""
        priceLabel.text = ""
        priceChangeLabel.text = ""
        amountLabel.isHidden = true
        valueCurrencyLabel.isHidden = true
        valueLabel.isHidden = true
        hidenValueLabel.isHidden = true
        WDP.dpPrice(nil, priceCurrencyLabel, priceLabel)
        WDP.dpPriceChanged(nil, priceChangeLabel, priceChangePercentLabel)
    }
    
    override func prepareForReuse() {
        coinImg.sd_cancelCurrentImageLoad()
        coinImg.image = UIImage(named: "tokenDefault")
        amountLabel.text = ""
        valueCurrencyLabel.text = ""
        valueLabel.text = ""
        priceChangeLabel.text = ""
        priceLabel.text = ""
        amountLabel.isHidden = true
        valueCurrencyLabel.isHidden = true
        valueLabel.isHidden = true
        hidenValueLabel.isHidden = true
        priceLabel.isHidden = false
        priceChangeLabel.isHidden = false
        WDP.dpPrice(nil, priceCurrencyLabel, priceLabel)
        WDP.dpPriceChanged(nil, priceChangeLabel, priceChangePercentLabel)
    }
    
    func bindCosmosClassAsset(_ baseChain: BaseChain, _ coin: Cosmos_Base_V1beta1_Coin) {
        if let cosmosFetcher = baseChain.getCosmosfetcher(),
           let msAsset = BaseData.instance.getAsset(baseChain.apiName, coin.denom) {
            let value = cosmosFetcher.denomValue(coin.denom)
            WDP.dpCoin(msAsset, coin, coinImg, symbolLabel, amountLabel, 6)
            WDP.dpPrice(msAsset, priceCurrencyLabel, priceLabel)
            WDP.dpPriceChanged(msAsset, priceChangeLabel, priceChangePercentLabel)
            if (BaseData.instance.getHideValue()) {
                hidenValueLabel.isHidden = false
            } else {
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                amountLabel.isHidden = false
                valueCurrencyLabel.isHidden = false
                valueLabel.isHidden = false
            }
        }
    }
    
    func bindCosmosClassToken(_ baseChain: BaseChain, _ token: MintscanToken) {
        if let cosmosFetcher = baseChain.getCosmosfetcher() {
            let value = cosmosFetcher.tokenValue(token.address!)
            WDP.dpToken(token, coinImg, symbolLabel, amountLabel, 6)
            WDP.dpPrice(token.coinGeckoId, priceCurrencyLabel, priceLabel)
            WDP.dpPriceChanged(token.coinGeckoId, priceChangeLabel, priceChangePercentLabel)
            if (BaseData.instance.getHideValue()) {
                hidenValueLabel.isHidden = false
            } else {
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                amountLabel.isHidden = false
                valueCurrencyLabel.isHidden = false
                valueLabel.isHidden = false
            }
        }
    }
    
    func bindOktAsset(_ oktChain: ChainOktEVM, _ coin: JSON) {
        if let oktFetcher = oktChain.oktFetcher,
           let token = oktFetcher.oktTokens.filter({ $0["symbol"].string == coin["denom"].string }).first {
            let original_symbol = token["original_symbol"].stringValue
            
            symbolLabel.text = original_symbol.uppercased()
            priceCurrencyLabel.text = token["description"].string
            coinImg.sd_setImage(with: ChainOktEVM.assetImg(original_symbol), placeholderImage: UIImage(named: "tokenDefault"))
            
            let availableAmount = oktFetcher.oktBalanceAmount(coin["denom"].stringValue)
            amountLabel?.attributedText = WDP.dpAmount(availableAmount.stringValue, amountLabel!.font, 18)
            if (BaseData.instance.getHideValue()) {
                hidenValueLabel.isHidden = false
            } else {
                amountLabel.isHidden = false
            }
            priceLabel.isHidden = true
            priceChangeLabel.isHidden = true
            priceChangePercentLabel.isHidden = true
        }
    }
    
    
    func bindEvmClassCoin(_ baseChain: BaseChain) {
        symbolLabel.text = baseChain.coinSymbol
        coinImg.image =  UIImage.init(named: baseChain.coinLogo)
        
        if let evmFetcher = baseChain.getEvmfetcher() {
            let dpAmount = evmFetcher.evmBalances.multiplying(byPowerOf10: -18, withBehavior: handler18Down)
            let value = evmFetcher.allCoinValue()
            WDP.dpPrice(baseChain.coinGeckoId, priceCurrencyLabel, priceLabel)
            WDP.dpPriceChanged(baseChain.coinGeckoId, priceChangeLabel, priceChangePercentLabel)
            amountLabel.attributedText = WDP.dpAmount(dpAmount.stringValue, amountLabel!.font, 6)
            if (BaseData.instance.getHideValue()) {
                hidenValueLabel.isHidden = false
            } else {
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                amountLabel.isHidden = false
                valueCurrencyLabel.isHidden = false
                valueLabel.isHidden = false
            }
            
        }
    }
    
    func bindEvmClassToken(_ baseChain: BaseChain, _ token: MintscanToken) {
        if let evmFetcher = baseChain.getEvmfetcher() {
            let value = evmFetcher.tokenValue(token.address!)
            WDP.dpToken(token, coinImg, symbolLabel, amountLabel, 6)
            WDP.dpPrice(token.coinGeckoId, priceCurrencyLabel, priceLabel)
            WDP.dpPriceChanged(token.coinGeckoId, priceChangeLabel, priceChangePercentLabel)
            if (BaseData.instance.getHideValue()) {
                hidenValueLabel.isHidden = false
            } else {
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                amountLabel.isHidden = false
                valueCurrencyLabel.isHidden = false
                valueLabel.isHidden = false
            }
        }
    }
    
    
    func bindSuiAsset(_ baseChain: BaseChain, _ balance: (String, NSDecimalNumber)) {
        if let suiFetcher = (baseChain as? ChainSui)?.getSuiFetcher() {
            if let msAsset = BaseData.instance.getAsset(baseChain.apiName, balance.0) {
                WDP.dpCoin(msAsset, balance.1, coinImg, symbolLabel, amountLabel, 6)
                WDP.dpPrice(msAsset, priceCurrencyLabel, priceLabel)
                WDP.dpPriceChanged(msAsset, priceChangeLabel, priceChangePercentLabel)
                
            } else if let metaData = suiFetcher.suiCoinMeta[balance.0] {
                coinImg.sd_setImage(with: metaData.assetImg(), placeholderImage: UIImage(named: "tokenDefault"))
                symbolLabel.text = metaData["symbol"].stringValue
                let dpAmount = balance.1.multiplying(byPowerOf10: -metaData["decimals"].int16Value, withBehavior: handler18Down)
                amountLabel.attributedText = WDP.dpAmount(dpAmount.stringValue, amountLabel!.font, 6)
                
            } else {
                symbolLabel.text = balance.0.suiCoinSymbol()
                let dpAmount = balance.1.multiplying(byPowerOf10: -9, withBehavior: handler18Down)
                amountLabel.attributedText = WDP.dpAmount(dpAmount.stringValue, amountLabel!.font, 6)
                
            }
            
            let value = suiFetcher.balanceValue(balance.0)
            WDP.dpValue(value, valueCurrencyLabel, valueLabel)
        }
        
        if (BaseData.instance.getHideValue()) {
            hidenValueLabel.isHidden = false
            
        } else {
            amountLabel.isHidden = false
            valueCurrencyLabel.isHidden = false
            valueLabel.isHidden = false
        }
    }
    
    
    func bindBtc(_ baseChain: BaseChain, _ section: Int) {
        symbolLabel.text = baseChain.coinSymbol
        coinImg.image =  UIImage.init(named: baseChain.coinLogo)
        
        if let btcFetcher = (baseChain as? ChainBitCoin84)?.getBtcFetcher() {
            let msPrice = BaseData.instance.getPrice(baseChain.coinGeckoId)
            var dpAmount = NSDecimalNumber.zero
            var value = NSDecimalNumber.zero
            if section == 0 {
                dpAmount = btcFetcher.btcBalances.multiplying(byPowerOf10: -8, withBehavior: handler8Down)
                value = dpAmount.multiplying(by: msPrice, withBehavior: handler6)
                
            } else if section == 1 {
                dpAmount = btcFetcher.btcPendingInput.multiplying(byPowerOf10: -8, withBehavior: handler8Down)
                value = dpAmount.multiplying(by: msPrice, withBehavior: handler6)
                
            } else if section == 2 {
                dpAmount = btcFetcher.btcPendingOutput.multiplying(byPowerOf10: -8, withBehavior: handler8Down)
                value = dpAmount.multiplying(by: msPrice, withBehavior: handler6)
                
            }
            amountLabel.attributedText = WDP.dpAmount(dpAmount.stringValue, amountLabel!.font, 6)
            if (BaseData.instance.getHideValue()) {
                hidenValueLabel.isHidden = false
            } else {
                WDP.dpValue(value, valueCurrencyLabel, valueLabel)
                amountLabel.isHidden = false
                valueCurrencyLabel.isHidden = false
                valueLabel.isHidden = false
            } 
        }
        WDP.dpPrice(baseChain.coinGeckoId, priceCurrencyLabel, priceLabel)
        WDP.dpPriceChanged(baseChain.coinGeckoId, priceChangeLabel, priceChangePercentLabel)
    }
    
}
