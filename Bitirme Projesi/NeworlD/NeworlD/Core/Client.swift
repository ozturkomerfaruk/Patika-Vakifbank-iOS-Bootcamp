//
//  Client.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation
import Alamofire

final class Client {
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
    
    static func getGameList(page: Int, pageSize: Int, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameList(page, pageSize).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getGameDetail(gameID: Int, completion: @escaping (GameDetailModel?, Error?) -> Void) {
        let urlString = EndPoints.getGameDetail(gameID).stringValue
        handleResponse(urlString: urlString, responseType: GameDetailModel.self) { responseModel, error in
            completion(responseModel, error)
        }
    }
    
    static func getGameListOrderingNewest(page: Int, pageSize: Int, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameListOrderingNewest(page, pageSize).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getGameListOrderingOldest(page: Int, pageSize: Int, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameListOrderingOldest(page, pageSize).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getGameListOrderingHighest(page: Int, pageSize: Int, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameListOrderingHighest(page, pageSize).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getGameListOrderingLowest(page: Int, pageSize: Int, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameListOrderingLowest(page, pageSize).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getGameListOrderingRecentlyAdded(page: Int, pageSize: Int, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameListOrderingRecentlyAdded(page, pageSize).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getGameListBySearch(searchGameName: String, completion: @escaping ([GameModel]?, Error?) -> Void) {
        let urlString = EndPoints.getGameListBySearch(searchGameName).stringValue
        handleResponse(urlString: urlString, responseType: GameBaseResponse.self) { responseModel, error in
            completion(responseModel?.results, error)
        }
    }
    
    static func getBasicGameModel(gameId: Int, completion: @escaping (BasicGameModel?, Error?) -> Void) {
        let urlString = EndPoints.getGameDetail(gameId).stringValue
        handleResponse(urlString: urlString, responseType: BasicGameModel.self) { responseModel, error in
            completion(responseModel, error)
        }
    }
}
