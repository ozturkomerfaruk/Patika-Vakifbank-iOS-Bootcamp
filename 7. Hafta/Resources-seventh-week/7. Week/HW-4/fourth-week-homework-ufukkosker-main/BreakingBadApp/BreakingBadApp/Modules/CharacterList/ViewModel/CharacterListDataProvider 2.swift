//
//  CharacterListDataProvider.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

final class CharacterListDataProvider: CharacterListDataProviderProtocol {
    private let breakingBadAPI: BreakingBadFetchable
    
    init(breakingBadAPI: BreakingBadAPI) {
        self.breakingBadAPI = breakingBadAPI
    }
    
    func fetchAllCharacters(request: CharacterListRequest, completion: @escaping (Result<[CharacterListResponse], APIError>) -> Void) {
        breakingBadAPI.characterList(request: request, completion: completion)
    }
}
