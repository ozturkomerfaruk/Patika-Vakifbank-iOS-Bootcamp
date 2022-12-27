//
//  BreakingBadAPI.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

protocol BreakingBadFetchable {
    func characterList(request: CharacterListRequest, completion: @escaping (Result<[CharacterListResponse], APIError>) -> Void)
    func quotesList(request: QuotesListRequest, completion: @escaping (Result<[QuotesListResponse], APIError>) -> Void)
    func episodeList(request: EpisodeListRequest, completion: @escaping(Result<[EpisodeListResponse], APIError>) -> Void)
}

final class BreakingBadAPI: BreakingBadFetchable {
    
    private let networkManager: Networking
    
    init(networkManager: Networking) {
        self.networkManager = networkManager
    }
    
    func characterList(request: CharacterListRequest, completion: @escaping (Result<[CharacterListResponse], APIError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
    func quotesList(request: QuotesListRequest, completion: @escaping (Result<[QuotesListResponse], APIError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
    func episodeList(request: EpisodeListRequest, completion: @escaping (Result<[EpisodeListResponse], APIError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
}
