//
//  GameModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import Foundation

struct GameModel: Decodable {
    let id: Int
    let slug: String
    let name: String
    let released: String
    let backgroundImage: String
    let rating: Double
    let parentPlatforms: [ParentPlatformsBaseModel]
    let genres: [GenresModel]
    let stores: [StoresBaseModel]
    let tags: [TagsModel]
    let shortScreenshots: [ShortScreenshotsModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case parentPlatforms = "parent_platforms"
        case genres
        case stores
        case tags
        case shortScreenshots = "short_screenshots"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? -1
        slug = try values.decodeIfPresent(String.self, forKey: .slug) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        released = try values.decodeIfPresent(String.self, forKey: .released) ?? ""
        backgroundImage = try values.decodeIfPresent(String.self, forKey: .backgroundImage) ?? ""
        rating = try values.decodeIfPresent(Double.self, forKey: .rating) ?? 0.0
        parentPlatforms = try values.decodeIfPresent([ParentPlatformsBaseModel].self, forKey: .parentPlatforms) ?? []
        genres = try values.decodeIfPresent([GenresModel].self, forKey: .genres) ?? []
        stores = try values.decodeIfPresent([StoresBaseModel].self, forKey: .stores) ?? []
        tags = try values.decodeIfPresent([TagsModel].self, forKey: .tags) ?? []
        shortScreenshots = try values.decodeIfPresent([ShortScreenshotsModel].self, forKey: .shortScreenshots) ?? []
        
    }
}
