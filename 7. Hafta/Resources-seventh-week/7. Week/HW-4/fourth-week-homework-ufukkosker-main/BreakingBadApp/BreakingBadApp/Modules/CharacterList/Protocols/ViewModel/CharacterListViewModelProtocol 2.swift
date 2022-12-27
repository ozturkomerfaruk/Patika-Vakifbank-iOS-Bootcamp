//
//  CharacterListViewModelProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

protocol CharacterListViewModelProtocol {
    var delegate: CharacterListVCDelegate? { get set }
    var allCharaters: [CharacterListResponse] { get set }
    var offsetCount: Int { get set }
    
    func viewDidLoad()
    func fetchCharacterList()
}

enum CharacterListVCOutput {
    case fetchedCharacters
}

protocol CharacterListVCDelegate {
    func handle(output: CharacterListVCOutput)
}
