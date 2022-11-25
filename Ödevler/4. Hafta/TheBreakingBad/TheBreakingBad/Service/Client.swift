//
//  Client.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

class Client {
    enum EndPoints {
        static let base = "https://www.breakingbadapi.com/api"
        
        case characters
        case getQuoteByAuthor(String)
        case episodes
        
        var stringValue: String {
            switch self {
            case .characters:
                return EndPoints.base + "/characters"
            case .getQuoteByAuthor(let author):
                return EndPoints.base + "/quote?author=\(author)"
            case .episodes:
                return EndPoints.base + "/episodes"
            }
        }
          
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    @discardableResult
    class func tasksForGETRequest<ResponseType: Codable>(url: URL, responseType: ResponseType.Type, completion: @escaping(ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                //UI objelerini mainQueue de yapmak zorundayız.
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                //ikinci bir try catch yapısı aslında, servisten dönen erroru da görebilmektir.
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
    
    class func getCharacters(completion: @escaping([CharacterModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.characters.url, responseType: [CharacterModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getQuoteByAuthor(author: String, completion: @escaping([QuoteByAuthorModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.getQuoteByAuthor(author).url,  responseType: [QuoteByAuthorModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getEpisodes(completion: @escaping([EpisodeModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.episodes.url, responseType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
