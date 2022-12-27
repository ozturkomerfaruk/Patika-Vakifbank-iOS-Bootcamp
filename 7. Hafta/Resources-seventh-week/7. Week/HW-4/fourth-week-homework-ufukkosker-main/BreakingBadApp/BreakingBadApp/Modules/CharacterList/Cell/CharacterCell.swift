//
//  CharacterCell.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var nickNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        containerView.layer.borderWidth = 2
//        containerView.layer.borderColor = UIColor.systemBlue.cgColor
//        containerView.layer.cornerRadius = 8
    }

    func config(with model: CharacterListResponse) {
        nameLabel.text = model.name
        ageLabel.text = model.birthday
        nickNameLabel.text = model.nickname
    }
}
