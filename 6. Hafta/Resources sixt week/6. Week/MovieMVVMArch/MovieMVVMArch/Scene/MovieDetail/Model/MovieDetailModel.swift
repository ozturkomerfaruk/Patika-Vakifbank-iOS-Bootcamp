//
//  MovieDetail.swift
//  MovieMVVMArch
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import Foundation

struct MovieDetailModel: Decodable {
    let title: String
    let poster: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case poster = "poster_path"
        case tagline
    }
}
