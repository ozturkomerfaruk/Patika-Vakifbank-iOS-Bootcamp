//
//  ResultHistoryModel.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

struct ResultHistoryModel: Codable {
    let orderType: String
    let price: Double
    let quantity: Double
    let total: Double
    
    enum CodingKeys: String, CodingKey {
        case orderType = "OrderType"
        case price = "Price"
        case quantity = "Quantity"
        case total = "Total"
    }
}
