//
//  BaseResponse.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
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
