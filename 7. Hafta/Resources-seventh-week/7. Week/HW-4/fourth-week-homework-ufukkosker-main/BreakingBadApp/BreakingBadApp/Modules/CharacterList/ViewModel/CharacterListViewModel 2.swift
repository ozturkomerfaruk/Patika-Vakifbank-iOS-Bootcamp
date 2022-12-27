//
//  CharacterListViewModel.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import Foundation

final class CharacterListViewModel: CharacterListViewModelProtocol {
    
    var allCharaters: [CharacterListResponse] = []
    var offsetCount: Int = 0
    var delegate: CharacterListVCDelegate?
    private let dataProvider: CharacterListDataProviderProtocol?
    
    init(dataProvider: CharacterListDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        fetchCharacterList()
    }
    
    func fetchCharacterList() {
        LoadingManager.shared.show()
        dataProvider?.fetchAllCharacters(request: .init(paths: [BreakingBadAPIConstant.characters.rawValue], offset: offsetCount), completion: { result in
            LoadingManager.shared.hide()
            switch result {
            case .success(let response):
                self.allCharaters.append(contentsOf: response)
                self.offsetCount += 10
                self.notify(.fetchedCharacters)
            case .failure(let error):
                print("foo error: \(error.description)")
            }
        })
    }
    
    private func notify(_ output: CharacterListVCOutput) {
        delegate?.handle(output: output)
    }
}
