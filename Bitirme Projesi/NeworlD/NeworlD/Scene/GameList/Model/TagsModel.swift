//
//  Tags.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct TagsModel: Decodable {
    let id: Int
    let name: String
    let slug: String
    let language: String
    let gamesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case language
        case gamesCount = "games_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.language = try container.decodeIfPresent(String.self, forKey: .language) ?? ""
        self.gamesCount = try container.decodeIfPresent(Int.self, forKey: .gamesCount) ?? -1
    }
}
