//
//  EpisodeListRequest.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import Foundation
 
struct EpisodeListRequest: RequestModelProtocol {
    var baseURL: String = ""
    var paths: [String] = []
    var parameters: [String: Any] = [:]
    var headers: [String: String] = [:]
    var method: RequestMethod = .get
    var body: [String: Any] = [:]
    
    init(paths: [String]) {
        self.paths = paths
        self.parameters = ["series":"Breaking+Bad"]
        prepareRequest()
    }
    
    mutating func prepareRequest() {
        baseURL = BreakingBadAPIConstant.baseURL.rawValue
    }
}
