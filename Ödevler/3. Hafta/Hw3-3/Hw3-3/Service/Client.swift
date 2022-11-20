//
//  Client.swift
//  Hw3-3
//
//  Created by Ömer Faruk Öztürk on 20.11.2022.
//

import Foundation

class Client {
    
    enum EndPoints {
        static let base = "https://programming-quotes-api.herokuapp.com"
        case quoteRandom
        var stringValue: String {
            switch self {
            case .quoteRandom:
                return EndPoints.base + "/Quotes/random"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    @discardableResult
    class func tasksForGetRequest<ResponseType: Codable>(url: URL, responseType: ResponseType.Type, completion: @escaping(ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
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
                    let errorResponseObject = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponseObject)
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
    
    class func getQuoteRandom(completion: @escaping(QuoteRandomModel?, Error?) -> Void) {
        
        tasksForGetRequest(url: EndPoints.quoteRandom.url, responseType: QuoteRandomModel.self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
