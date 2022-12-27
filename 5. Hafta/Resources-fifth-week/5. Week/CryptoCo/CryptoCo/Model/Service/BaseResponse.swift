//
//  BaseResponse.swift
//  ServiceCall
//
//  Created by Kaan YILDIRIM on 13.11.2022.
//

import Foundation

struct BaseResponse: Codable {
    let success: Bool
    let message: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return message
    }
}
