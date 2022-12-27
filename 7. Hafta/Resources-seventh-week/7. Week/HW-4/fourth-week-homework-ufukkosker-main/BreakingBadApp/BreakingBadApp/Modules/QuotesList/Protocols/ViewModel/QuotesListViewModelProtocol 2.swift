//
//  QuotesListViewModelProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import Foundation

protocol QuotesListViewModelProtocol {
    var delegate: QuotesListVCDelegate? { get set }
    var allQuotes: [QuotesListResponse] { get set }
    var nameOfSelectedCharacter: String { get set }
    
    func viewDidLoad()
    func fetchAllQuotesList(with characterName: String)
}

enum QuotesListVCOutput {
    case fetchedAllQuotes
}

protocol QuotesListVCDelegate {
    func handle(output: QuotesListVCOutput)
}
