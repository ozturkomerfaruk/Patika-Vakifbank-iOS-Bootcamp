//
//  CastModel.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 25.11.2022.
//

import Foundation


struct CastModel: Codable {
    let charID: Int
    let name, birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname, portrayed: String

    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, portrayed
    }
}

