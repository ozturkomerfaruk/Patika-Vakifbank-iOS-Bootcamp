//
//  CharacterDetailVCViewModelProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 24.11.2022.
//

import Foundation

protocol CharacterDetailVCViewModelProtocol {
    var delegate: CharacterDetailVCDelegate? { get set }
    var character: CharacterListResponse? { get set }
    var sections: [CharacterDetailSectionType] { get set }
    
    func viewDidLoad()
}

enum CharacterDetailVCOutput {
    case fetchedCharacter
}

protocol CharacterDetailVCDelegate {
    func handle(output: CharacterDetailVCOutput)
}
