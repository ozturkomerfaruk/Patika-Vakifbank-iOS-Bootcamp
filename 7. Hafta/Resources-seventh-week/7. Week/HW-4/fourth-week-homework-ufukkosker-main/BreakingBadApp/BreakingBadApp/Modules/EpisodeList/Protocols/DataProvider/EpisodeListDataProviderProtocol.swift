//
//  EpisodeListDataProviderProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import Foundation

protocol EpisodeListDataProviderProtocol {
    func fetchAllEpisodes(request: EpisodeListRequest, completion: @escaping (Result<[EpisodeListResponse], APIError>) -> Void)
}
