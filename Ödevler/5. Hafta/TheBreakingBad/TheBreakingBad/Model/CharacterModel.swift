//
//  CharacterModel.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    let charID: Int
    let name: String
    let birthday: String
    let img: String
    let status: String
    let nickname: String
    let portrayed: String
    let occupation: [String]
    let appearance: [Int]

    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name = "name"
        case birthday = "birthday"
        case img = "img"
        case status = "status"
        case nickname = "nickname"
        case portrayed = "portrayed"
        case occupation = "occupation"
        case appearance = "appearance"
    }
}
