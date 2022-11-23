//
//  GetAssetsModel.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 23.11.2022.
//

import Foundation

// MARK: - GetAssets
struct GetAssetsModel: Codable {
    let success: Bool
    let message: String
    let result: [ResultModel]
}


