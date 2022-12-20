//
//  GamesForNotesViewModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 12.12.2022.
//

import Foundation

protocol GamesForNotesViewModelProtocol {
    var delegate: GamesForNotesViewModelDelegate? { get set }
    
    func fetchSearchGames(searchGameName: String)
    func getSearchGamesCount() -> Int
    func getSearchGame(at index: Int) -> GameModel?
}

protocol GamesForNotesViewModelDelegate: AnyObject {
    func gamesLoaded()
    func gamesFailed(error: Error)
    
     func preFetch()
     func postFetch()
}

final class GamesForNotesViewModel: GamesForNotesViewModelProtocol {
    weak var delegate: GamesForNotesViewModelDelegate?
    private var searchGames: [GameModel]?
    
    func fetchSearchGames(searchGameName: String) {
        delegate?.preFetch()
        Client.getGameListBySearch(searchGameName: searchGameName) { [weak self] games, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.gamesFailed(error: error)
            }
            self.searchGames = games
            self.delegate?.gamesLoaded()
        }
        delegate?.postFetch()
    }
    
    func getSearchGamesCount() -> Int {
        return searchGames?.count ?? 0
    }
    
    func getSearchGame(at index: Int) -> GameModel? {
        return searchGames?[index]
    }
    
}
