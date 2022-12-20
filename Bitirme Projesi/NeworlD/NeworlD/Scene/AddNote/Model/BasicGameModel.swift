//
//  AddNoteModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import Foundation

struct BasicGameModel: Decodable {
    var id: Int
    var name: String
    var backgroundImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "background_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.backgroundImage = try values.decodeIfPresent(String.self, forKey: .backgroundImage) ?? ""
    }
}
