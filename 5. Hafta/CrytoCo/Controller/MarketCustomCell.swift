//
//  MarketCustomCell.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class MarketCustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var assetLabel: UILabel!
    @IBOutlet weak var assetLongLabel: UILabel!
    
    
    func configureCell(model: ResultMarketModel) {
        self.nameLabel.text = model.marketName
        self.assetLabel.text = model.marketAsset
        self.assetLongLabel.text = model.marketAssetLong
    }
    
}
