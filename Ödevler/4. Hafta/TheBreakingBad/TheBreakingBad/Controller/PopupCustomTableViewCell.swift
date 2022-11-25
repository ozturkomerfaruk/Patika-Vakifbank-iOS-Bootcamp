//
//  PopupCustomTableViewCell.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

class PopupCustomTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    func configureCell(name: String) {
        nameLabel.text = name
    }
    
}
