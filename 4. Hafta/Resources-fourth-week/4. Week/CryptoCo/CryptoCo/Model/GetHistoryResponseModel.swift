//
//  GetHistoryResponseModel.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import Foundation

//Optional case - This time result is nil, not default empty array
//struct GetHistoryResponseModel: Codable {
//    let success: Bool
//    let message: String
//    let result: [HistoryModel]?
//}

//Default case
struct GetHistoryResponseModel: Codable {
    let success: Bool
    let message: String
    let result: [HistoryModel]
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success) ?? false
        message = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
        result = try values.decodeIfPresent([HistoryModel].self, forKey: .result) ?? []
    }
}
