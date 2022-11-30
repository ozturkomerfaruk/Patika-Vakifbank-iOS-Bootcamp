//
//  CustomDetailCell.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class CustomDetailCell: UITableViewCell {

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    func configureCell(model: ResultHistoryModel) {
        self.priceLabel.text = "Price: " + String(model.price)
        self.quantityLabel.text = "Quantity: " + String(model.quantity)
        self.totalLabel.text = "Total: " + String(model.total)
        decideBackgroundColor(type: model.orderType)
    }
    
    private func decideBackgroundColor(type: String) {
        backgroundColor = type == "SELL" ? .red : .green
    }
}
