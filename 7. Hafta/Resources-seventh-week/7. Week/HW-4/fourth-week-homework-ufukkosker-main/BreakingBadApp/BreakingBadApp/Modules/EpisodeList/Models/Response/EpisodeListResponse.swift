//
//  EpisodeListResponse.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import Foundation

struct EpisodeListResponse: Codable {
    let episodeId: Int?
    let title: String?
    let season: String?
    let airDate: String?
    let characters: [String]?
    let episode: String?
    let series: String?
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case title
        case season
        case airDate = "air_date"
        case characters
        case episode
        case series
    }
}
