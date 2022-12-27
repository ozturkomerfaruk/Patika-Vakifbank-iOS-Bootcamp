//
//  CharacterDetailVCViewModel.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import Foundation

final class CharacterDetailVCViewModel: CharacterDetailVCViewModelProtocol {
    var delegate: CharacterDetailVCDelegate?
    var character: CharacterListResponse?
    var sections: [CharacterDetailSectionType] = []
    
    init(character: CharacterListResponse) {
        self.character = character
    }
    
    func viewDidLoad() {
        guard let characterName = character?.name,
              let characterNickname = character?.nickname,
              let characterBirthday = character?.birthday,
              let characterStatus = character?.status,
              let characterPortrayed = character?.portrayed
        else { return }
        sections.append(.characterImage)
        sections.append(.characterName("Name:", characterName))
        sections.append(.characterNickName("Nick Name:", characterNickname))
        sections.append(.characterBirthday("Birthday:", characterBirthday))
        sections.append(.characterStatus("Status:", characterStatus))
        sections.append(.characterPortrayed("Portrayed:", characterPortrayed))
        sections.append(.seeAllQuotes)
        notify(.fetchedCharacter)
    }
    
    private func notify(_ output: CharacterDetailVCOutput) {
        delegate?.handle(output: output)
    }
}

