//
//  CharacterDetailSectionType.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import Foundation

enum CharacterDetailSectionType {
    case characterImage
    case characterName(_ title: String, _ value: String)
    case characterNickName(_ title: String, _ value: String)
    case characterBirthday(_ title: String, _ value: String)
    case characterStatus(_ title: String, _ value: String)
    case characterPortrayed(_ title: String, _ value: String)
    case seeAllQuotes
}
