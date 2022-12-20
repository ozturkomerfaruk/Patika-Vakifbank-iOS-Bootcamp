//
//  GameNotesCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import UIKit

final class GameNotesCustomCell: UITableViewCell {

    @IBOutlet private weak var gamesTitle: UILabel!

    func configure(titleString: String) {
        gamesTitle.text = titleString
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .clear
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets.init(top: 4, left: 0, bottom: 4, right: 0))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        let customCellView = UIView()
        customCellView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = customCellView
    }
}
