//
//  GetAssetsResponseModel.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import Foundation

struct GetAssetsResponseModel: Codable {
    let success: Bool
    let message: String
    let result: [AssetModel]
}
