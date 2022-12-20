//
//  Endpoints.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

enum EndPoints {
    static private let BASE_GAME = "https://api.rawg.io/api"
    static private let API_KEY = "?key=\(Constants.API_KEY)"
    
    case getGameList(Int, Int)
    case getGameDetail(Int)
    case getGameListOrderingNewest(Int, Int)
    case getGameListOrderingOldest(Int, Int)
    case getGameListOrderingHighest(Int, Int)
    case getGameListOrderingLowest(Int, Int)
    case getGameListOrderingRecentlyAdded(Int, Int)
    case getGameListBySearch(String)
    
    var stringValue: String {
        switch self {
        case .getGameList(let page, let pageSize):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&page=\(page)&page_size=\(pageSize)"
        case .getGameDetail(let gameID):
            return EndPoints.BASE_GAME + "/games/\(gameID)" + EndPoints.API_KEY
        case .getGameListOrderingNewest(let page, let pageSize):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&page=\(page)&page_size=\(pageSize)" + "&ordering=-released"
        case .getGameListOrderingOldest(let page, let pageSize):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&page=\(page)&page_size=\(pageSize)" + "&ordering=released"
        case .getGameListOrderingHighest(let page, let pageSize):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&page=\(page)&page_size=\(pageSize)" + "&ordering=-rating"
        case .getGameListOrderingLowest(let page, let pageSize):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&page=\(page)&page_size=\(pageSize)" + "&ordering=rating"
        case .getGameListOrderingRecentlyAdded(let page, let pageSize):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&page=\(page)&page_size=\(pageSize)" + "&ordering=added"
        case .getGameListBySearch(let searchGameName):
            return EndPoints.BASE_GAME + "/games" + EndPoints.API_KEY + "&search=" + searchGameName
        }
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
}
