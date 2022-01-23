//
//  TxRewardCell.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/02/13.
//  Copyright © 2020 wannabit. All rights reserved.
//

import UIKit

class TxRewardCell: TxCell {
    
    @IBOutlet weak var txIcon: UIImageView!
    @IBOutlet weak var delegatorLabel: UILabel!
    @IBOutlet weak var validatorLabel: UILabel!
    @IBOutlet weak var monikerLabel: UILabel!
    
    @IBOutlet weak var incen0Layer: UIView!
    @IBOutlet weak var incen0Amount: UILabel!
    @IBOutlet weak var incen0Denom: UILabel!
    @IBOutlet weak var incen1Layer: UIView!
    @IBOutlet weak var incen1Amount: UILabel!
    @IBOutlet weak var incen1Denom: UILabel!
    @IBOutlet weak var incen2Layer: UIView!
    @IBOutlet weak var incen2Amount: UILabel!
    @IBOutlet weak var incen2Denom: UILabel!
    @IBOutlet weak var incen3Layer: UIView!
    @IBOutlet weak var incen3Amount: UILabel!
    @IBOutlet weak var incen3Denom: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        incen0Amount.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        incen1Amount.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        incen2Amount.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        incen3Amount.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
    }
    
    override func onBindMsg(_ chain: ChainType, _ response: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) {
        txIcon.image = txIcon.image?.withRenderingMode(.alwaysTemplate)
        txIcon.tintColor = WUtils.getChainColor(chain)
        
        let msg = try! Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.init(serializedData: response.tx.body.messages[position].value)
        delegatorLabel.text = msg.delegatorAddress
        validatorLabel.text = msg.validatorAddress
        if let validator = BaseData.instance.mAllValidators_gRPC.filter({ $0.operatorAddress == msg.validatorAddress}).first {
            monikerLabel.text = "(" + validator.description_p.moniker + ")"
        }
        
        let rewardsCoins = WUtils.onParseStakeRewardGrpc(response,  position)
        print("rewardsCoins ", rewardsCoins)
        if (rewardsCoins.count > 0) {
            incen0Layer.isHidden = false
            WUtils.showCoinDp(rewardsCoins[0], incen0Denom, incen0Amount, chain)
        }
        if (rewardsCoins.count > 1) {
            incen1Layer.isHidden = false
            WUtils.showCoinDp(rewardsCoins[1], incen1Denom, incen1Amount, chain)
        }
        if (rewardsCoins.count > 2) {
            incen2Layer.isHidden = false
            WUtils.showCoinDp(rewardsCoins[2], incen2Denom, incen2Amount, chain)
        }
        if (rewardsCoins.count > 3) {
            incen3Layer.isHidden = false
            WUtils.showCoinDp(rewardsCoins[3], incen3Denom, incen3Amount, chain)
        }
    }
}
