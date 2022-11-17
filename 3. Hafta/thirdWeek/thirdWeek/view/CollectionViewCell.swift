//
//  CollectionViewCell.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var count: UILabel!
    
    func configure(model: ItemModel) {
        name.text = model.name
        count.text = String(model.count)
    }
}

