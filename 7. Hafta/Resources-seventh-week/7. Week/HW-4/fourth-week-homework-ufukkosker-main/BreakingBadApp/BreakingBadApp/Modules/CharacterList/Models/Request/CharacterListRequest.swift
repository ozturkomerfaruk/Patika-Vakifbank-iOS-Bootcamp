//
//  CharacterListRequest.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

struct CharacterListRequest: RequestModelProtocol {
    var baseURL: String = ""
    var paths: [String] = []
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]
    var method: RequestMethod = .get
    var body: [String : Any] = [:]
    
    private var offset: Int = 0
    
    init(paths: [String], offset: Int) {
        self.paths = paths
        self.offset = offset
        prepareRequest()
    }
    
    mutating func prepareRequest() {
        self.baseURL = BreakingBadAPIConstant.baseURL.rawValue
        self.parameters = [
            "limit": 10,
            "offset": offset
        ]
    }
}
