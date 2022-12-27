//
//  Client.swift
//  ServiceCall
//
//  Created by Kaan YILDIRIM on 13.11.2022.
//

import Foundation

class Client {

    enum Endpoints {
        static let base = "https://nova.bitcambio.com.br/api/v3/public"

        case assets
        case markets
        case marketDetail(String)

        var stringValue: String {
            switch self {
            case .assets:
                return Endpoints.base + "/getassets"
            case .markets:
                return Endpoints.base + "/getmarkets"
            case .marketDetail(let marketId):
                return Endpoints.base + "/getmarkethistory?market=\(marketId)"
            }
        }

        var url: URL {
            return URL(string: stringValue)!
        }
    }

    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, hasRange: Bool = false, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
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
        taskForGETRequest(url: Endpoints.assets.url, responseType: GetAssetResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getMarkets(completion: @escaping ([MarketModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.markets.url, responseType: GetMarketResponseModel.self) { response, error in
            if let response = response {
                completion(response.result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getMarketHistory(market: String, completion: @escaping ([HistoryModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.marketDetail(market).url, responseType: GetMarketHistoryResponseModel.self) { response, error in
            if let response = response {
                if !response.message.isEmpty {
                    completion(nil, BaseResponse(success: false, message: response.message))
                } else {
                    completion(response.result, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
}
