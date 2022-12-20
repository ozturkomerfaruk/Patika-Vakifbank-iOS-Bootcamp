//
//  GameBaseResponse.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct GameBaseResponse: Decodable {
    let count: Int
    let next: String
    let previous: String
    let results: [GameModel]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
        next = try values.decodeIfPresent(String.self, forKey: .next) ?? ""
        previous = try values.decodeIfPresent(String.self, forKey: .previous) ?? ""
        results = try values.decodeIfPresent([GameModel].self, forKey: .results) ?? []
    }
}
