//
//  Client.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 25.11.2022.
//

import Foundation

final class Client {
    
    enum Endpoints {
        static let base = "https://www.breakingbadapi.com/api"
        
        case cast
        case castWithId(String)
        case quotesByAuthor(String)
        case episodes
        case episodesById(String)

        var stringValue: String {
            switch self {
            case .cast:
                return Endpoints.base + "/characters?category=Breaking+Bad"
            case .castWithId(let actorId):
                return Endpoints.base + "/characters/\(actorId)"
            case .quotesByAuthor(let actorNameSurname):
                return Endpoints.base + "/quote?author=\(actorNameSurname)"
            case .episodes:
                return Endpoints.base + "/episodes?series=Breaking+Bad"
            case .episodesById(let episodeId):
                return Endpoints.base + "/episodes/\(episodeId)"
            }
        }

        var url: URL {
            return URL(string: stringValue)!
        }
    }
    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()

        return task
    }
//     Karakterlerin Cekildiği fonksiyon
    class func getCast(completion: @escaping ([CastModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.cast.url, responseType: [CastModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    //    Karakterin Cekildiği fonksiyon idye göre
    class func getCastById(castId: String, completion: @escaping (CastModel?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.castWithId(castId).url, responseType: [CastModel].self) { response, error in
            if let response = response {
                completion(response.first, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    //    Bölümlerin Cekildiği fonksiyon
    class func getEpisode(completion: @escaping ([EpisodeModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodes.url, responseType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    //    Bölümlerin Cekildiği fonksiyon Id ye göre
    class func getEpisodeById(episodeId: String, completion: @escaping (EpisodeModel?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodesById(episodeId).url, responseType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response.first, nil)
            } else {
                completion(nil, error)
            }
        }
    }
//    Sözlerin Cekildiği fonksiyon
    class func getQuotes(castName: String, completion: @escaping ([QuoteModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.quotesByAuthor(castName).url, responseType: [QuoteModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
