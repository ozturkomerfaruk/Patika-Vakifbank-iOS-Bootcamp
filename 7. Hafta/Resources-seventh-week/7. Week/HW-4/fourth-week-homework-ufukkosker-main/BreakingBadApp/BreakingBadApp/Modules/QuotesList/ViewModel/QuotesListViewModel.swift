//
//  QuotesListViewModel.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import Foundation

final class QuotesListViewModel: QuotesListViewModelProtocol {
    var delegate: QuotesListVCDelegate?
    var allQuotes: [QuotesListResponse] = []
    var nameOfSelectedCharacter: String
    private let dataProvider: QuotesListDataProviderProtocol?
    
    init(dataProvider: QuotesListDataProviderProtocol, nameOfSelectedCharacter: String) {
        self.dataProvider = dataProvider
        self.nameOfSelectedCharacter = nameOfSelectedCharacter
    }
    
    func viewDidLoad() {
        fetchAllQuotesList(with: nameOfSelectedCharacter)
    }
    
    func fetchAllQuotesList(with characterName: String) {
        LoadingManager.shared.show()
        dataProvider?.fetchAllQuotes(request: QuotesListRequest(paths: [BreakingBadAPIConstant.quote.rawValue], author: characterName), completion: { result in
            LoadingManager.shared.hide()
            switch result {
            case .success(let response):
                self.allQuotes = response
                self.notify(.fetchedAllQuotes)
            case .failure(let error):
                print("error: \(error)")
            }
        })
    }
    
    private func notify(_ output: QuotesListVCOutput) {
        delegate?.handle(output: output)
    }
}
