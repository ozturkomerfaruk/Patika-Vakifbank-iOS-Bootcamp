//
//  StoreBaseResponse.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct StoresBaseModel: Decodable {
    let id: Int
    let store: StoreModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case store
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.store = try values.decode(StoreModel.self, forKey: .store)
    }
}

struct StoreModel: Decodable {
    let id: Int
    let name: String
    let slug: String
    let domain: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case domain
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? ""
        self.domain = try values.decodeIfPresent(String.self, forKey: .domain) ?? ""
    }
}
