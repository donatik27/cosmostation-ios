//
//  SuiStakingCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 8/11/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON

class SuiStakingCell: UITableViewCell {
    
    @IBOutlet weak var rootView: CardViewCell!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pendingImg: UIImageView!
    @IBOutlet weak var objectIdLabel: UILabel!
    @IBOutlet weak var totalStakedLabel: UILabel!
    @IBOutlet weak var principalLabel: UILabel!
    @IBOutlet weak var estimatedRewardLabel: UILabel!
    @IBOutlet weak var startEaringLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        logoImg.sd_cancelCurrentImageLoad()
        logoImg.image = UIImage(named: "validatorDefault")
        pendingImg.isHidden = true
    }
    
    func onBindMyStake(_ baseChain: ChainSui, _ stake: (String, JSON)) {
        if let suiFetcher = baseChain.suiFetcher {
            if let validator = suiFetcher.suiValidators.filter({ $0["suiAddress"].stringValue == stake.0 }).first {
                logoImg.sd_setImage(with: validator.suiValidatorImg(), placeholderImage: UIImage(named: "tokenDefault"))
                nameLabel.text = validator["name"].stringValue
            }
        }
        
        if (stake.1["status"].stringValue == "Pending") {
            pendingImg.isHidden = false
        }
        objectIdLabel.text = stake.1["stakedSuiId"].stringValue
        
        let principal = NSDecimalNumber(string: stake.1["principal"].stringValue).multiplying(byPowerOf10: -9)
        let estimatedReward = NSDecimalNumber(string: stake.1["estimatedReward"].stringValue).multiplying(byPowerOf10: -9)
        principalLabel?.attributedText = WDP.dpAmount(principal.stringValue, principalLabel!.font, 9)
        estimatedRewardLabel?.attributedText = WDP.dpAmount(estimatedReward.stringValue, principalLabel!.font, 9)
        totalStakedLabel?.attributedText = WDP.dpAmount(estimatedReward.adding(principal).stringValue, principalLabel!.font, 9)
        startEaringLabel.text = "Epoch #" + stake.1["stakeActiveEpoch"].stringValue
    }
}
