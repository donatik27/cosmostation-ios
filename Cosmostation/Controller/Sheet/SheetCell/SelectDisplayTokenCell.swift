//
//  SelectDisplayTokenCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 3/5/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import UIKit

class SelectDisplayTokenCell: UITableViewCell {
    
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var coinImg: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        coinImg.af.cancelImageRequest()
        coinImg.image = UIImage(named: "tokenDefault")
        symbolLabel.text = ""
        descriptionLabel.text = ""
    }
    
    func bindErc20Token(_ chain: EvmClass, _ token: MintscanToken, _ selectedList: [String]) {
        if (selectedList.contains(token.address!)) {
            rootView.layer.borderWidth = 1.0
            rootView.layer.borderColor = UIColor.white.cgColor
        } else {
            rootView.layer.borderWidth = 0.5
            rootView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        }
        
        coinImg?.af.setImage(withURL: token.assetImg())
        symbolLabel.text = token.symbol
        descriptionLabel.text = token.description
    }
    
}
