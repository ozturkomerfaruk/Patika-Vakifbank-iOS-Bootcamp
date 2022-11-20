//
//  ZookeeperCustomCell.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class ZookeeperCustomCell: UITableViewCell {
    
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numOfAnimalLabel: UILabel!
    @IBOutlet private weak var salary: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: ZookeeperModel) {
        nameLabel.text = model.name
        numOfAnimalLabel.text = "Animal: \(String(describing: model.animalList.count))"
        salary.text = String(describing: model.salary!)
    }
    
}
