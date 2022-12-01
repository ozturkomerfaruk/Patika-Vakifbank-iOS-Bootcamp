//
//  PopupCustomTableViewCell.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

final class PopupCustomTableViewCell: UITableViewCell {
    //MARK: CustomCell for Popup Characters
    @IBOutlet private weak var nameLabel: UILabel!
    func configureCell(name: String) {
        nameLabel.text = name
    }
    
}
