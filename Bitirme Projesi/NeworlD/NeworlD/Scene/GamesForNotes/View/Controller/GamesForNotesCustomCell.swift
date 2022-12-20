//
//  GamesForNotesCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import UIKit

final class GamesForNotesCustomCell: UITableViewCell {
    @IBOutlet private weak var gamesImage: UIImageView!
    @IBOutlet private weak var gamesTitle: UILabel!
    
    func configure(model: GameModel) {
        if model.backgroundImage == Constants.APIWebNilURL {
            gamesImage.load(url: URL(string: Constants.OPPSImageURL)!)
        } else {
            gamesImage.load(url: URL(string: model.backgroundImage) ?? URL(string: Constants.OPPSImageURL)!)
        }
        gamesTitle.text = model.name
    }
    
    override func prepareForReuse() {
        gamesImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        let customCellView = UIView()
        customCellView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = customCellView
    }
}
