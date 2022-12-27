//
//  MyCollectionViewCell.swift
//  ListComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    func configure(model: ItemModel) {
        nameLabel.text = model.name
        countLabel.text = String(model.count)
    }
}
