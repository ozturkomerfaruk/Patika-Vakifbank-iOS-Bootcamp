//
//  GameDetailModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 9.12.2022.
//

import Foundation

struct GameDetailModel: Decodable {
    
    let website: String
    let publishers: [PublisherModel]
    let descriptionRaw: String
    let ratings: [RatingModel]
    let parentPlatforms: [ParentPlatformsBaseModel]
    let released: String
    let name: String
    let redditDescription: String
    let backgroundImage: String
    
    enum CodingKeys: String, CodingKey {
        case website
        case publishers
        case descriptionRaw = "description_raw"
        case ratings
        case parentPlatforms = "parent_platforms"
        case released
        case name
        case redditDescription = "reddit_description"
        case backgroundImage = "background_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.website = try values.decodeIfPresent(String.self, forKey: .website) ?? ""
        self.publishers = try values.decodeIfPresent([PublisherModel].self, forKey: .publishers) ?? []
        self.descriptionRaw = try values.decodeIfPresent(String.self, forKey: .descriptionRaw) ?? "nil"
        self.ratings = try values.decodeIfPresent([RatingModel].self, forKey: .ratings) ?? []
        self.parentPlatforms = try values.decodeIfPresent([ParentPlatformsBaseModel].self, forKey: .parentPlatforms) ?? []
        self.released = try values.decodeIfPresent(String.self, forKey: .released) ?? ""
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.redditDescription = try values.decodeIfPresent(String.self, forKey: .redditDescription) ?? ""
        self.backgroundImage = try values.decodeIfPresent(String.self, forKey: .backgroundImage) ?? ""
        
    }
}

    
