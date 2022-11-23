//
//  Client.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 23.11.2022.
//

import Foundation

class Client {
    enum EndPoints {
        static let base = "https://nova.bitcambio.com.br/api/v3/public"
        case getassets
        var stringValue: String {
            switch self {
            case .getassets:
                return EndPoints.base + "/getassets"
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
    
    class func getGetassets(completion: @escaping([ResultModel]?, Error?) -> Void) {
        tasksForGETRequest(url: EndPoints.getassets.url, responseType: GetAssetsModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
