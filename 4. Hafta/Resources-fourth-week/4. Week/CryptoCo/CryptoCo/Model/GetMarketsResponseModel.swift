//
//  GetMarketsResponseModel.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import Foundation

struct GetMarketsResponseModel: Codable {
    let success: Bool
    let message: String
    let result: [MarketModel]
}
