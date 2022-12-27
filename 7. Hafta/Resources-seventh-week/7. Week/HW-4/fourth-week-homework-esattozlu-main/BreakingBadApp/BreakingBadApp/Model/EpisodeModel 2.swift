//
//  EpisodeModel.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 23.11.2022.
//

import Foundation

// Breaking Bad Episodes Model
struct EpisodeModel: Codable {
    let episodeId: Int
    let title: String
    let season: String
    let airDate: String
    let characters: [String]
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case title
        case season
        case airDate = "air_date"
        case characters
        case episode
    }
}
