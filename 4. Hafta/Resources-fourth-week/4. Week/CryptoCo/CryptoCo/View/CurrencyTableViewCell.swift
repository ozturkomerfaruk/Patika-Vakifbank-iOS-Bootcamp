//
//  CurrencyTableViewCell.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import UIKit

final class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    
    func configureCell(model: AssetModel) {
        nameLabel.text = model.assetLong
        symbolLabel.text = model.asset
    }
    
}
