//
//  CharacterInfoCell.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import UIKit

class CharacterInfoCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}
