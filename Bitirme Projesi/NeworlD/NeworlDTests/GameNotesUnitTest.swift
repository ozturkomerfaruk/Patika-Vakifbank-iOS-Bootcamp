//
//  GameNotesUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//

import XCTest
@testable import NeworlD


final class GameNotesUnitTest: XCTestCase {
    var sut: GameNotesViewModel!
    var delegate: GameNotesViewModelDelegate!
    var fetchExpectation: XCTestExpectation!

    override func setUpWithError() throws {
        sut = GameNotesViewModel()
        delegate = self
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetAppendGameNote() {
        XCTAssertEqual(sut.getGameNotesCount(), 0)
        
        CoreDataManager.shared.saveNote(title: "title", body: "body", gameId: 1)
        sut.fetchGameNotes()
        
        XCTAssertNotEqual(sut.getGameNotesCount(), 0)
    }
    
    func testGetGameNotes() {
        //Given
        XCTAssertEqual(sut.getGameNotesCount(), 0)
        
        //When
        CoreDataManager.shared.saveNote(title: "title", body: "body", gameId: 1)
        sut.fetchGameNotes()
        
        //Then
        XCTAssertEqual(sut.getGameNotes(index: 0).title, "title")
        XCTAssertEqual(sut.getGameNotes(index: 0).body, "body")
        XCTAssertEqual(sut.getGameNotes(index: 0).gameId, 1)
    }
    
    func testDeleteGameNote() {
        CoreDataManager.shared.saveNote(title: "title", body: "body", gameId: 999)
        sut.fetchGameNotes()
        var mockObject = GameNoteEntity()
        let lastIndex = sut.getGameNotesCount() - 1
        mockObject = sut.getGameNotes(index: lastIndex)
        
        XCTAssertEqual(mockObject.gameId, 999)
        XCTAssertEqual(mockObject.title, "title")
        XCTAssertEqual(mockObject.body, "body")
        
        CoreDataManager.shared.deleteNote(model: mockObject)
        sut.fetchGameNotes()
        
        XCTAssertNotEqual(mockObject.gameId, 999)
    }
    
    func testUpdateGameNote() {
        CoreDataManager.shared.saveNote(title: "title", body: "body", gameId: 1)
        sut.fetchGameNotes()
        var mockObject = GameNoteEntity()
        let lastIndex = sut.getGameNotesCount() - 1
        mockObject = sut.getGameNotes(index:  lastIndex)
        XCTAssertEqual(mockObject.title, "title")
        XCTAssertEqual(mockObject.body, "body")
        XCTAssertEqual(mockObject.gameId, 1)
        
        
        mockObject.gameId = 99
        mockObject.body = "99Body"
        mockObject.title = "99Title"
        
        //Then
        XCTAssertEqual(sut.getGameNotes(index: lastIndex).title, "99Title")
        XCTAssertEqual(sut.getGameNotes(index: lastIndex).body, "99Body")
        XCTAssertEqual(sut.getGameNotes(index: lastIndex).gameId, 99)
    }
    
    func testIsArrayEmpty() {
        XCTAssertEqual(sut.getGameNotesCount(), 0)
        
        CoreDataManager.shared.saveNote(title: "title", body: "body", gameId: 1)
        sut.fetchGameNotes()
        
        XCTAssertNotEqual(sut.getGameNotesCount(), 0)
    }
}

extension GameNotesUnitTest: GameNotesViewModelDelegate {
    func notesLoaded() {
        fetchExpectation.fulfill()
    }
    
    func notesFailed(error: Error) {
        
    }
    
    func preFetch() {
        
    }
    
    func postFetch() {
        
    }
    
    
}
