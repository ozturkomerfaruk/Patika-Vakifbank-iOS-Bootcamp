//
//  RatingsCustomCell.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 10.12.2022.
//

import UIKit

final class RatingsCustomCell: UITableViewCell {
    
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var countLbl: UILabel!
    @IBOutlet private weak var percentLbl: UILabel!
    
    func configureCustomCell(model: RatingModel) {
        titleLbl.text = model.title.capitalized
        countLbl.text = String(model.count) + " Count"
        percentLbl.text = String(model.percent) + "%"
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
