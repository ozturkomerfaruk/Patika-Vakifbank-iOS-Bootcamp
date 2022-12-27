//
//  Client.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import Foundation

final class Client {
    
    enum Endpoints {
        static let base = "https://nova.bitcambio.com.br/api/v3/public"

        case assets
        case markets
        case marketHistory(String)

        var stringValue: String {
            switch self {
            case .assets:
                return Endpoints.base + "/getassets"
            case .markets:
                return Endpoints.base + "/getmarkets"
            case .marketHistory(let marketId):
                return Endpoints.base + "/getmarkethistory?market=\(marketId)"
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
    
    class func getAssets(completion: @escaping ([AssetModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.assets.url, responseType: GetAssetsResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getMarkets(completion: @escaping ([MarketModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.markets.url, responseType: GetMarketsResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getMarketHistory(market: String, completion: @escaping ([HistoryModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.marketHistory(market).url, responseType: GetHistoryResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
