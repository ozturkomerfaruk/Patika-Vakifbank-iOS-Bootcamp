//
//  Genres.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct GenresModel: Decodable {
    let id: Int
    let slug: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
    }
    
    
}
