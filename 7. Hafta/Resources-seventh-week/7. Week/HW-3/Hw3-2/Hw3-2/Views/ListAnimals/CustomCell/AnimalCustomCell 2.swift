//
//  AnimalCustomCell.swift
//  Hw3-2
//
//    
//

import UIKit

final class AnimalCustomCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var zookeeperLabel: UILabel!
    
    func configure(name: String, type: String, zookeeper: String) {
        nameLabel.text = name
        typeLabel.text = type
        zookeeperLabel.text = zookeeper
    }
    
}
