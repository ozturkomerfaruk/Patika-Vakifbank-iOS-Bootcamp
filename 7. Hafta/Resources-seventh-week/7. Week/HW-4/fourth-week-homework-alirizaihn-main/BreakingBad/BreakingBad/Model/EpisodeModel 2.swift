//
//  EpisodeModel.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 26.11.2022.
//

import Foundation

struct EpisodeModel: Codable {
    let episodeID: Int
    let title: String
    let season, episode: String
    let airDate: String
    let characters: [String]

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season, episode
        case airDate = "air_date"
        case characters
    }
}
