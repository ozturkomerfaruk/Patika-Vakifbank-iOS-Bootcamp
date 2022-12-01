//
//  QuoteByAuthorModel.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

// MARK: - QuoteByAuthorModel
struct QuoteByAuthorModel: Codable {
    var quoteId: Int
    var quote: String
    var author: String
    var series: String

    enum CodingKeys: String, CodingKey {
        case quoteId = "quote_id"
        case quote = "quote"
        case author = "author"
        case series = "series"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.quoteId = try container.decode(Int.self, forKey: .quoteId) ?? 1
        self.quote = try container.decode(String.self, forKey: .quote) ?? ""
        self.author = try container.decode(String.self, forKey: .author) ?? ""
        self.series = try container.decode(String.self, forKey: .series) ?? ""
    }
}
