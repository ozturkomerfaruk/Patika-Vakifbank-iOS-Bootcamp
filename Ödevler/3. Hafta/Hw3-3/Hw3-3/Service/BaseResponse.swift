//
//  BaseResponse.swift
//  Hw3-3
//
//  Created by Ömer Faruk Öztürk on 20.11.2022.
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
