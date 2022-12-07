//
//  MovieModel.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import Foundation

struct MovieModel: Decodable {
    var id: Int
    var title: String
    var poster: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
    }
}
