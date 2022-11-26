//
//  CharacterCustomCollectionCell.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class CharacterCustomCollectionCell: UICollectionViewCell {

    //MARK: Values
    @IBOutlet private weak var myView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ninckNameLabel: UILabel!
    @IBOutlet private weak var portrayedLabel: UILabel!
    
    //MARK: ConfigureCell
    func configureCell(model: CharacterModel) {
        nameLabel.text = model.name
        ninckNameLabel.text = model.nickname
        portrayedLabel.text = model.portrayed
        
        changeBackgroundColor()
    }
    
    //MARK: Updating BackgroundCell
    private func changeBackgroundColor() {
        let colors: [UIColor] = [.systemRed, .systemBlue, .systemCyan, .systemGray, .systemPink, .systemTeal,.systemBrown, .systemOrange, .systemGreen, .systemYellow, .systemPurple]
        let randomInt = Int.random(in: 1..<11)
        self.myView.backgroundColor = colors[randomInt]
    }
    
}
