//
//  ItemTableViewCell.swift
//  ListComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
