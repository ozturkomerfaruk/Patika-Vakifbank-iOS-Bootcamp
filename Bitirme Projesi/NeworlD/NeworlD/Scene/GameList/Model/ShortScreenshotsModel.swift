//
//  ShortScreenshots.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct ShortScreenshotsModel: Decodable {
    let id: Int
    let image: String
    
    enum CodingKeys: CodingKey {
        case id
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}
