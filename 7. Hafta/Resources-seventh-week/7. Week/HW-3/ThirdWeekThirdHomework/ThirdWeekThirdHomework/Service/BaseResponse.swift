//
//  BaseResponse.swift
//  ThirdWeekThirdHomework
//
//    
//

import Foundation

struct BaseResponse: Codable {
    let status: Int
    let error: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}
