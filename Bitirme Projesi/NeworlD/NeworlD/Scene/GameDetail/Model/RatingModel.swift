//
//  RatingModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 9.12.2022.
//

import Foundation

struct RatingModel: Decodable {
    var id: Int
    var title: String
    var count: Int
    var percent: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case count
        case percent
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.count = try values.decodeIfPresent(Int.self, forKey: .count) ?? -1
        self.percent = try values.decodeIfPresent(Double.self, forKey: .percent) ?? 0.0
    }
}
