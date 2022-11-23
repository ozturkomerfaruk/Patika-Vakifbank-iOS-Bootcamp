//
//  ResultModel.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 23.11.2022.
//

import Foundation

// MARK: - Result
struct ResultModel: Codable {
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
