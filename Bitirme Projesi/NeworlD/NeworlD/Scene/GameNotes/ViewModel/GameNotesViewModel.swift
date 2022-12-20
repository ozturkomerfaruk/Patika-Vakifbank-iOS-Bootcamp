//
//  GameNotesViewModel.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 12.12.2022.
//

import Foundation 
import CoreData

protocol GameNotesViewModelProtocol {
    var delegate: GameNotesViewModelDelegate? { get set }
 
    func getGameNotesCount() -> Int
    func fetchGameNotes()
    func getGameNotes(index: Int) -> GameNoteEntity 
    func appendGameNote(title: String, body: String, gameId: Int)
    func deleteGameNote(index: Int)
}

protocol GameNotesViewModelDelegate: AnyObject {
    func notesLoaded()
    func notesFailed(error: Error)
    
    func preFetch()
    func postFetch() 
}

final class GameNotesViewModel: GameNotesViewModelProtocol {
    weak var delegate: GameNotesViewModelDelegate?
    private var notes: [GameNoteEntity]?
    
    func getGameNotesCount() -> Int {
        return notes?.count ?? 0
    }
    
    func fetchGameNotes() {
        notes = CoreDataManager.shared.getNotes()
        self.delegate?.notesLoaded()
        if notes?.count == 0 {
            delegate?.preFetch()
        } else {
            delegate?.postFetch()
        }
    }
    
    func getGameNotes(index: Int) -> GameNoteEntity {
        return notes![index]
    }
    
    func appendGameNote(title: String, body: String, gameId: Int) {
        notes?.append(CoreDataManager.shared.saveNote(title: title, body: body, gameId: gameId)!)
        delegate?.notesLoaded()
        if notes?.count != 0 {
            delegate?.postFetch()
        }
    }
    
    func deleteGameNote(index: Int) {
        let model = notes![index]
        notes?.remove(at: index)
        CoreDataManager.shared.deleteNote(model: model)
        delegate?.notesLoaded()
        if notes?.count == 0 {
            delegate?.preFetch()
        }
    }
    
    func updateGameNote(title: String, body: String, gameId: Int, model: GameNoteEntity) {
        CoreDataManager.shared.updateNote(title: title, body: body, gameId: gameId, model: model)
        delegate?.notesLoaded()
    }
    
    func isArrayEmpty() -> Bool {
        return notes?.count == 0 ? true : false
    }
}
