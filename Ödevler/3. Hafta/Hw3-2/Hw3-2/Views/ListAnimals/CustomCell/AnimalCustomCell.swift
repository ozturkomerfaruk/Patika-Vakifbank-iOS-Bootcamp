//
//  AnimalCustomCell.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 19.11.2022.
//

import UIKit

class AnimalCustomCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var typeLabel: UILabel!
    
    @IBOutlet private weak var zookeeperLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(name: String, type: String, zookeeper: String) {
        nameLabel.text = name
        typeLabel.text = type
        zookeeperLabel.text = zookeeper
    }
    
}
