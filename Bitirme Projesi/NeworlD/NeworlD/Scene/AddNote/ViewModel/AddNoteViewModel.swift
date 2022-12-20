//
//  AddNoteViewModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 13.12.2022.
//

import Foundation

protocol AddNoteViewModelProtocol{
    var delegate: AddNoteViewModelDelegate? { get set }
    
    func fetchGamesWithId(id: Int)
    func getGameWithId() -> BasicGameModel?
}

protocol AddNoteViewModelDelegate: AnyObject {
    func gamesLoaded()
    func gamesFailed(error: Error)
    
     func preFetch()
     func postFetch()
}

final class AddNoteViewModel: AddNoteViewModelProtocol {
    weak var delegate: AddNoteViewModelDelegate?
    private var game: BasicGameModel?
    
    func fetchGamesWithId(id: Int) {
        delegate?.preFetch()
        Client.getBasicGameModel(gameId: id) { [weak self] game, error in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.gamesFailed(error: error)
            }
            self.game = game
            self.delegate?.gamesLoaded()
        }
        delegate?.postFetch()
    }
    
    func getGameWithId() -> BasicGameModel? {
        return game
    }
}
