//
//  ItemTableViewCell.swift
//  ListComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    
    func configureCell(model: AssetModel) {
        nameLabel.text = model.assetLong
        symbolLabel.text = model.asset
    }
    
}
