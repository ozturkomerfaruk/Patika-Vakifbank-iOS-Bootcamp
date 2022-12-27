//
//  GetPopularMoviesResponseModel.swift
//  MovieMVCPattern
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import Foundation

struct GetPopularMoviesResponseModel: Decodable {
    let results: [MovieModel]
}
