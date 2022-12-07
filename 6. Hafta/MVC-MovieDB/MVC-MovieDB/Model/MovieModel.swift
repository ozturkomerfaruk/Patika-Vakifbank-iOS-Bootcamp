//
//  MovieModel.swift
//  MVC-MovieDB
//
//  Created by Ömer Faruk Öztürk on 6.12.2022.
//

import Foundation

struct MovieModel: Codable {
    var id: Int
    var title: String
    var poster: String
        
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case poster = "poster_path"
    }
}
