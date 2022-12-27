//
//  QuotesListDataProviderProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import Foundation

protocol QuotesListDataProviderProtocol {
    func fetchAllQuotes(request: QuotesListRequest, completion: @escaping (Result<[QuotesListResponse], APIError>) -> Void)
}
