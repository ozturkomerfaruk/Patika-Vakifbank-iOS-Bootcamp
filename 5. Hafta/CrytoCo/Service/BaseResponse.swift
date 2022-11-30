//
//  BaseResponse.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 23.11.2022.
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
