//
//  CharacterImageCell.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import UIKit

class CharacterImageCell: UITableViewCell {

    @IBOutlet private weak var characterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        characterImageView.layer.cornerRadius = 8
        characterImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configImage(with url: String) {
        characterImageView.downloaded(from: url, contentMode: .scaleAspectFill)
    }
}
