//
//  BaseResponse.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 25.11.2022.
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
