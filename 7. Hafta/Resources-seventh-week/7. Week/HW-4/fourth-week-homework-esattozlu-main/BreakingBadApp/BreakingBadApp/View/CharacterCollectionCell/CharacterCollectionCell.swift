//
//  CharacterCollectionCell.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 22.11.2022.
//

import UIKit

class CharacterCollectionCell: UICollectionViewCell {

    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var nickname: UILabel!
    var character: CharacterModel? {
        didSet {
            configureComponents()
            configureCell()
            getCharacterImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // configures components
    func configureComponents() {
        name.text       = character?.name
        birthday.text   = character?.birthday
        nickname.text   = character?.nickname
        characterImageView.image = UIImage()
    }
    
    // cell configuration
    func configureCell() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 15
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
    }

    // gets image of characters
    func getCharacterImage() {
        guard let character = character else { return }
        NetworkManager.getImage(from: character.img) { image in
            guard let image = image else { return }
            self.characterImageView.image = UIImage()
            self.characterImageView.image = image
        }
    }
}
