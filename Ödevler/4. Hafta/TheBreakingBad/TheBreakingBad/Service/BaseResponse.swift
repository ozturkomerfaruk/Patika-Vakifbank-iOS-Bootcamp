//
//  BaseResponse.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

//MARK: Base Response Model
struct BaseResponse: Codable {
    let status: Int
    let error: String
}

extension BaseResponse: LocalizedError {
    var errorDescription: String? {
        return error
    }
}
