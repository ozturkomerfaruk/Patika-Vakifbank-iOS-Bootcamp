//
//  HistoryTableViewCell.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    
    func configureCell(model: HistoryModel) {
        priceLabel.text = "Price: " + String(model.price)
        quantityLabel.text = "Quantitiy: " + String(model.quantity)
        totalLabel.text = "Total: " + String(model.total)
        decideBackgroundColor(type: model.orderType)
    }
    
    private func decideBackgroundColor(type: String) {
        if type == "SELL" {
            backgroundColor = .red
        } else {
            backgroundColor = .green
        }
    }
}
