//
//  QuotesListResponse.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import Foundation

struct QuotesListResponse: Codable {
    let id: Int?
    let quote: String?
    let author: String?
    let series: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "quote_id"
        case quote
        case author
        case series
    }
}
