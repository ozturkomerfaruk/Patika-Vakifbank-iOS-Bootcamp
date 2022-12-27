//
//  NetworkManager.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

protocol Networking {
    func request<T: Codable>(request: RequestModelProtocol, completion: @escaping (Result<T, APIError>) -> Void)
}

final class NetworkManager: Networking {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(request: RequestModelProtocol, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable, T : Encodable {

        guard let generateRequest = request.generateRequest() else {
            completion(.failure(.badRequest))
            return
        }
        let task = session.dataTask(with: generateRequest) { data, response, error in
            if error != nil || data == nil { completion(.failure(.connectionError)) }
            
            if let apiError = self.returnResponseErrorIfNeeded(response: response) {
                completion(.failure(apiError))
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        task.resume()
    }
}
private extension NetworkManager {
    
    func returnError(with responseCode: Int) -> APIError {
        switch responseCode {
        case 400:
            return .notFound
        case 403:
            return .unknownError
        case 408:
            return .timeOut
        case 500:
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func returnResponseErrorIfNeeded(response: URLResponse?) -> APIError? {
        if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
            print("foo: \(httpResponse.statusCode)")
            return returnError(with: httpResponse.statusCode)
        }
        return nil
    }
}
