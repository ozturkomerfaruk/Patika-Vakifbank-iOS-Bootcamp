//
//  PublisherModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 9.12.2022.
//

import Foundation

struct PublisherModel: Decodable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}
