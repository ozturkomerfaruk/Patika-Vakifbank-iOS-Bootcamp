//
//  QuotesListRequest.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import Foundation

struct QuotesListRequest: RequestModelProtocol {
    var baseURL: String = ""
    var paths: [String] = []
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]
    var method: RequestMethod = .get
    var body: [String: Any] = [:]
    
    private var author: String = ""
    init(paths: [String], author: String) {
        self.paths = paths
        self.author = author
        prepareRequest()
    }
    
    mutating func prepareRequest() {
        self.baseURL = BreakingBadAPIConstant.baseURL.rawValue
        self.parameters = [
            "author": author
        ]
    }
}
