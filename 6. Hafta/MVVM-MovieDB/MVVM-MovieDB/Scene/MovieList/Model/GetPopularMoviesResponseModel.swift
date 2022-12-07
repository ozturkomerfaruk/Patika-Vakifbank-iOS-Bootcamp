//
//  GetPopularMoviesResponseModel.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import Foundation

struct GetPopularMoviesResponseModel: Decodable {
    var results: [MovieModel]
}
