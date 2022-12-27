//
//  EpisodeListDataProvider.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import Foundation

final class EpisodeListDataProvider: EpisodeListDataProviderProtocol {
    
    private let breakingBadAPI: BreakingBadFetchable
    
    init(breakingBadAPI: BreakingBadAPI) {
        self.breakingBadAPI = breakingBadAPI
    }
    
    func fetchAllEpisodes(request: EpisodeListRequest, completion: @escaping (Result<[EpisodeListResponse], APIError>) -> Void) {
        breakingBadAPI.episodeList(request: request, completion: completion)
    }
}
