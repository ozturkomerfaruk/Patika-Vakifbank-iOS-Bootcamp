//
//  CustomTableViewCell.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var maritalLabel: UILabel!
    @IBOutlet private weak var homeCityLabel: UILabel!
    @IBOutlet private weak var hometownLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: Employee) {
        nameLabel.text = model.name
        typeLabel.text = String(describing: model.employeeType?.stringValue ?? "")
    }
    
}
