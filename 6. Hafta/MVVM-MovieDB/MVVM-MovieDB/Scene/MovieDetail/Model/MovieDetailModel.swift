//
//  MovieDetailModel.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import Foundation

struct MovieDetailModel: Codable {
    let title: String
    let poster: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case poster = "poster_path"
        case tagline
    }
}
