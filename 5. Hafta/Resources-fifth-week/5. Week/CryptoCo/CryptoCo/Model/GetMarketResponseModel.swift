//
//  GetMarketResponseModel.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import Foundation

struct GetMarketResponseModel: Codable {
    let success: Bool
    let message: String
    let result: [MarketModel]
}
