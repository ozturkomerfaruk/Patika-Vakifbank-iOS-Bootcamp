//
//  AssetModel.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import Foundation

struct AssetModel: Codable {
    let asset: String
    let assetLong: String
    let withdrawTxFee: Double
    let withdrawTxFeePercent: Double
    
    enum CodingKeys: String, CodingKey {
        case asset = "Asset"
        case assetLong = "AssetLong"
        case withdrawTxFee = "WithdrawTxFee"
        case withdrawTxFeePercent = "WithdrawTxFeePercent"
    }
}
