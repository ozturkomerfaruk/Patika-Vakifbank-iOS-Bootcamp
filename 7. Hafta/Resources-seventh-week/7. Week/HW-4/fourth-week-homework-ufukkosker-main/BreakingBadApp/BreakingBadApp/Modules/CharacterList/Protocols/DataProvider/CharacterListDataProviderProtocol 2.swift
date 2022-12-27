//
//  CharacterListDataProviderProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

protocol CharacterListDataProviderProtocol {
    func fetchAllCharacters(request: CharacterListRequest, completion: @escaping (Result<[CharacterListResponse], APIError>) -> Void)
}
