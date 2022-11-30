//
//  ResultMarketModel.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

struct ResultMarketModel: Codable {
    let marketName: String
    let marketAsset: String
    let baseAsset: String
    let marketAssetLong: String
    
    enum CodingKeys: String, CodingKey {
        case marketName = "MarketName"
        case marketAsset = "MarketAsset"
        case baseAsset = "BaseAsset"
        case marketAssetLong = "MarketAssetLong"
    }
}
