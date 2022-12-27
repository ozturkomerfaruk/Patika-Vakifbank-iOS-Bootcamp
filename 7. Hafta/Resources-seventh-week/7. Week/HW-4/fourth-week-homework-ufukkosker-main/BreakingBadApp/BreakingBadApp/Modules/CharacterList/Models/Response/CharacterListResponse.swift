//
//  CharacterListResponse.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

// MARK: - CharacterListResponse
struct CharacterListResponse: Codable {
    let charID: Int?
    let name: String?
    let birthday: String?
    let occupation: [String]?
    let img: String?
    let status: String?
    let nickname: String?
    let appearance: [Int]?
    let portrayed: String?
    let betterCallSaulAppearance: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name
        case birthday
        case occupation
        case img
        case status
        case nickname
        case appearance
        case portrayed
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}
