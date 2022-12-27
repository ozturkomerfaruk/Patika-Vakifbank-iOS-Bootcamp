//
//  QuotesListDataProvider.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import Foundation

final class QuotesListDataProvider: QuotesListDataProviderProtocol {
    private let breakingBadAPI: BreakingBadFetchable
    
    init(breakingBadAPI: BreakingBadAPI) {
        self.breakingBadAPI = breakingBadAPI
    }
    
    func fetchAllQuotes(request: QuotesListRequest, completion: @escaping (Result<[QuotesListResponse], APIError>) -> Void) {
        breakingBadAPI.quotesList(request: request, completion: completion)
    }
}
