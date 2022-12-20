//
//  TagsCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 9.12.2022.
//

import UIKit

final class TagsCustomCell: UITableViewCell {

    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var gamesCount: UILabel!
    @IBOutlet private weak var language: UILabel!
    
    func configureTagsCustomCell(tagModel: TagsModel) {
        name.text = tagModel.name
        gamesCount.text = String(tagModel.gamesCount) + "\ngames found"
        language.text = tagModel.language
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .black
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
        
        let customCellView = UIView()
        customCellView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = customCellView
    }
}
