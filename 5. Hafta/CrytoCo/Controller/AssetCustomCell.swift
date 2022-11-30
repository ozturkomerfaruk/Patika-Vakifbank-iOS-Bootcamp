//
//  AssetCustomCell.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 23.11.2022.
//

import UIKit

class AssetCustomCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    
    func configureCell(model: ResultModel) {
        nameLabel.text = model.assetLong
        symbolLabel.text = model.asset
    }
    
}
