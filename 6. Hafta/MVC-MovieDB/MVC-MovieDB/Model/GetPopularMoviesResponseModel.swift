//
//  GetPopularMoviesResponseModel.swift
//  MVC-MovieDB
//
//  Created by Ömer Faruk Öztürk on 6.12.2022.
//

import Foundation

struct GetPopularMoviesResponseModel: Codable {
    var results: [MovieModel]
}
