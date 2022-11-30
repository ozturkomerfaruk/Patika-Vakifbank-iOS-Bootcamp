//
//  GetMarketsModel.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

struct GetMarketsModel: Codable {
    let success: Bool
    let message: String
    let result: [ResultMarketModel]
}
