//
//  ZookeeperCustomCell.swift
//  Hw3-2
//
//    
//

import UIKit

final class ZookeeperCustomCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numOfAnimalLabel: UILabel!
    @IBOutlet private weak var salary: UILabel!
    
    func configure(model: ZookeeperModel) {
        nameLabel.text = model.name
        numOfAnimalLabel.text = "Animal: \(String(describing: model.animalList.count))"
        salary.text = String(describing: model.salary!)
    }
    
}
