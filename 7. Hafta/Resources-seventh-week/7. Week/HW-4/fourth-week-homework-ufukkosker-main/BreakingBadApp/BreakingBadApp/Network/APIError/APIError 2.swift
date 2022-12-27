//
//  APIError.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

enum APIError: Error {
    case unknownError
    case connectionError
    case notFound
    case serverError
    case timeOut
    case badRequest
    case decodeError
}

extension APIError: CustomStringConvertible {
    
    public var description: String{
        switch self {
        case .unknownError:
            return "Unknown Error!"
        case .notFound:
            return "Not Found!"
        case.badRequest:
            return "Bad Request"
        case .connectionError:
            return "Connection Error"
        case .serverError:
            return "Server Error"
        case .decodeError:
            return "Decoding Error"
        case .timeOut:
            return "TimeOut Error"
        }
    }
}
