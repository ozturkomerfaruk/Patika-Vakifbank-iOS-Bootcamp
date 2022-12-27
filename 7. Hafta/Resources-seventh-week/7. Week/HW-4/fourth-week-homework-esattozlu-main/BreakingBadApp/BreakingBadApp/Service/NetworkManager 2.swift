//
//  NetworkManager.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 22.11.2022.
//

import UIKit

class NetworkManager {
    
    enum Endpoints {
        static let base = "https://www.breakingbadapi.com/api/"
        
        case characters
        case quotes(String)
        case episodes
        case charactersByName(String)
        
        var urlString: String {
            switch self {
            case .characters:
                return Endpoints.base + "characters?category=Breaking+Bad"
            case .quotes(let nameToSearch):
                return Endpoints.base + "quote?author=\(nameToSearch)"
            case .episodes:
                return Endpoints.base + "episodes?series=Breaking+Bad"
            case .charactersByName(let nameToSearch):
                return Endpoints.base + "characters?name=\(nameToSearch)"
            }
        }
        
        var url: URL {
            return URL(string: urlString)!
        }
    }
    
    
    // generic get request
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    
    // to get character info
    class func getCharacters(completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.characters.url, responseType: [CharacterModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    // gets character info by name
    class func getCharacters(nameToSearch: String ,completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.charactersByName(nameToSearch).url, responseType: [CharacterModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    // gets images from URL
    class func getImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: urlString) else {
                completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
            let data = data,
            let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completed(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completed(image)
            }
        }
        task.resume()
    }
    
    // gets quotes of a character
    class func getQuotesForCharacter(nameToSearch: String, completion: @escaping ([QuoteModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.quotes(nameToSearch).url, responseType: [QuoteModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    // gets episodes
    class func getEpisodes(completion: @escaping ([EpisodeModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodes.url, responseType: [EpisodeModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}



