//
//  EpisodeModel.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import Foundation

// MARK: - CharacterModelElement
struct EpisodeModel: Codable {
    let episodeID: Int
    let title: String
    let season: String
    let airDate: String
    let characters: [String]
    let episode: String
    let series: String

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title
        case season
        case airDate = "air_date"
        case characters
        case episode
        case series
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.episodeID = try container.decode(Int.self, forKey: .episodeID) ?? 1
        self.title = try container.decode(String.self, forKey: .title) ?? ""
        self.season = try container.decode(String.self, forKey: .season) ?? ""
        self.airDate = try container.decode(String.self, forKey: .airDate) ?? ""
        self.characters = try container.decode([String].self, forKey: .characters) ?? []
        self.episode = try container.decode(String.self, forKey: .episode) ?? ""
        self.series = try container.decode(String.self, forKey: .series) ?? ""
    }
}
