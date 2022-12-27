//
//  MarketTableViewCell.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import UIKit

final class MarketTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var assetLabel: UILabel!
    @IBOutlet private weak var assetLongLabel: UILabel!
    
    func configureCell(model: MarketModel) {
        nameLabel.text = model.marketName
        assetLabel.text = model.marketAsset
        assetLongLabel.text = model.marketAssetLong
    }
}
