//
//  SpellModel.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import Foundation

struct SpellModel: Codable {
    let id: String?
    let name: String?
    let incantation: String?
    let effect: String?
    let canBeVerbal: Bool?
    let type: String?
    let light: String?
}
