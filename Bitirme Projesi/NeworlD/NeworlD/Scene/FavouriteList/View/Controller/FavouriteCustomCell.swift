//
//  FavouriteCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import UIKit

protocol FavouriteCustomCellDelegate: AnyObject {
    func deleteFavourite(index: Int)
}

final class FavouriteCustomCell: UICollectionViewCell {
    weak var delegate: FavouriteCustomCellDelegate?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favouriteButtonOutlet: UIButton!
    
    var index: Int?
    
    func configureCustomCell(fav: FavouritesEntity?) {
        Client.getBasicGameModel(gameId: Int(fav!.gameId)) { [weak self] model, error in
            guard let self = self else { return }
            self.imageView.load(url: URL(string: model!.backgroundImage) ?? URL(string: Constants.OPPSImageURL)!)
        }
        
        favouriteButtonOutlet.layer.cornerRadius = favouriteButtonOutlet.frame.width / 2
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "heart.fill", withConfiguration: largeConfig)
        favouriteButtonOutlet.setImage(largeBoldDoc, for: .normal)
        
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 15
        self.imageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        delegate?.deleteFavourite(index: index!)
    }
    
}
