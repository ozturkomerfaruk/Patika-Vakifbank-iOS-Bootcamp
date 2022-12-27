//
//  QuoteCell.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet private weak var quoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with quote: String) {
        quoteLabel.text = quote
    }
}
