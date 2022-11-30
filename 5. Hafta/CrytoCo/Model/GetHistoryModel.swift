//
//  GetHistoryModel.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

struct GetHistoryModel: Codable {
    let success: Bool 
    let message: String
    let result: [ResultHistoryModel]
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
        case result = "result"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success) ?? false
        self.message = try container.decode(String.self, forKey: .message) ?? ""
        self.result = try container.decode([ResultHistoryModel].self, forKey: .result) ?? []
    }
}

