//
//  Client.swift
//  MVC-MovieDB
//
//  Created by Ömer Faruk Öztürk on 6.12.2022.
//

import Foundation
import Alamofire

class Client {
    //Not: Bu API_KEY saklı bir yerlerden gelmesi gerekmekte. Başka bir file'dan olabilir ya da daha derin bir yerlerden Keychain den felan gelmesi lazım. Gizli bilgi, erişelememesi gerekmekte.
    //Bunu derinlemesine bi araştır.
    static private let API_KEY = "gizli bilgi"
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


//Class'ı singleton yapılabilir ancak Singleton daha çok, eğer object üzerinde bir state tutmak gerekiyorsa, yani T süre bir zaman söz konusuysa Singleton daha çok tercih ediliyor.


