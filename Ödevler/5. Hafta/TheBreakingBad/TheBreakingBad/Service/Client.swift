//
//  Client.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

//MARK: Client Service
class Client {
    enum EndPoints {
        //base api
        static let base = "https://www.breakingbadapi.com/api"
        
        //MARK: Endpoints
        case characters
        case getQuoteByAuthor(String)
        case episodes
        case characterByName(String)
        
        var stringValue: String {
            switch self {
            case .characters:
                return EndPoints.base + "/characters"
            case .getQuoteByAuthor(let author):
                return EndPoints.base + "/quote?author=\(author)"
            case .episodes:
                return EndPoints.base + "/episodes"
            case .characterByName(let name):
                return EndPoints.base + "/characters?name=\(name)"
            }
        }
          
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    // General Get Request
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
    
    //MARK: getCharacters
    class func getCharacters(completion: @escaping([CharacterModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.characters.url, responseType: [CharacterModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    //MARK: getQuoteByAuthor
    class func getQuoteByAuthor(author: String, completion: @escaping([QuoteByAuthorModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.getQuoteByAuthor(author).url,  responseType: [QuoteByAuthorModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    //MARK: getEpisodes
    class func getEpisodes(completion: @escaping([EpisodeModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.episodes.url, responseType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    //MARK: getCharacterByName
    class func getCharacterByName(name: String, completion: @escaping([CharacterModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.characterByName(name).url,  responseType: [CharacterModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
