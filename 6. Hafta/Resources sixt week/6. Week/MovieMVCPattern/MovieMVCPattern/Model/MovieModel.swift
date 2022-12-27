//
//  MovieModel.swift
//  MovieMVCPattern
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let title: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
    }
}
