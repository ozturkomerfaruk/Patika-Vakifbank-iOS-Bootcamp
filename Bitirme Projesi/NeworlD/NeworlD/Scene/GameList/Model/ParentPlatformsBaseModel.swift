//
//  PlatformBaseResponse.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct ParentPlatformsBaseModel: Decodable {
    let platform: PlatformModel
    
    enum CodingKeys: String, CodingKey {
        case platform
    }
  
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        platform = try values.decode(PlatformModel.self, forKey: .platform)
    }
}

struct PlatformModel: Decodable {
    let id: Int
    let name: String
    let slug: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? ""
    }
}
