//
//  Client.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//


import Foundation
import Alamofire

class Client {

    static private let API_KEY = "d2e28e8093d38e50ce94d05f8d710b44"
    static let BASE_URL = "https://api.themoviedb.org/3"
    static let IMAGE_BASE_URL = "https://image.tmdb.org/t/p/original"
    
    static private func handleResponse<T: Decodable>(urlString: String, responseType: T.Type, completion: @escaping (T?, Error?) -> Void) {
        AF.request(urlString).response { response in
            guard let data = response.value else {
                DispatchQueue.main.async {
                    completion(nil, response.error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(T.self, from: data!)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
    
    static func getPopularMovies(completion: @escaping ([MovieModel]?, Error?) -> Void) {
        let urlString = "\(BASE_URL)/discover/movie?sort_by=popularity.desc&api_key=\(API_KEY)"
        
        handleResponse(urlString: urlString, responseType: GetPopularMoviesResponseModel.self) { response, error in
            completion(response?.results, error)
        }
    }
    
    static func getMovieDetail(moveId: Int, completion: @escaping (MovieDetailModel?, Error?) -> Void) {
        let urlString = "\(BASE_URL)/movie/\(moveId)?&api_key=\(API_KEY)"
        
        handleResponse(urlString: urlString, responseType: MovieDetailModel.self) { response, error in
            completion(response, error)
        }
    }
}
