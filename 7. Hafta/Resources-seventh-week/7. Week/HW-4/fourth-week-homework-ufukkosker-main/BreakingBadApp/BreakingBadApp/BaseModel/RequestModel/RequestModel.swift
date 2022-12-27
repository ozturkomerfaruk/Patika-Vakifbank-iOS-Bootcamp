//
//  RequestModel.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

class RequestModel {
    
    var baseURL: String {
        ""
    }
    
    var path : [String]{
        []
    }
    
    var parameters: [String: Any?] {
        [:]
    }
    
    var headers : [String: String] {
        [:]
    }
    
    var method: RequestMethod{
        .get
    }
    
    var body: [String: Any?] {
        [
            "accept": "application/json"
        ]
    }
}

protocol RequestModelProtocol {
    var baseURL: String { get set }
    var paths: [String] { get set }
    var parameters: [String: Any] { get set }
    var headers: [String: String] { get set }
    var method: RequestMethod { get set }
    var body: [String: Any] { get set }
    
    func generateRequest() -> URLRequest?
    mutating func prepareRequest()
}
