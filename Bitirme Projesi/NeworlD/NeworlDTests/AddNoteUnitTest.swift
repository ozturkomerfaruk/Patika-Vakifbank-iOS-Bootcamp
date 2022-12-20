//
//  AddNoteUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//

import XCTest
@testable import NeworlD

final class AddNoteUnitTest: XCTestCase {
    var sut: AddNoteViewModel!
    var fetchExpectation: XCTestExpectation!

    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = AddNoteViewModel()
        sut.delegate = self
        fetchExpectation = expectation(description: "addNote")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetGameWithId() {
        XCTAssertNil(sut.getGameWithId())
        
        sut.fetchGamesWithId(id: 3328)
        waitForExpectations(timeout: 10)
    

        XCTAssertEqual(sut.getGameWithId()?.id, 3328)
        XCTAssertEqual(sut.getGameWithId()?.name, "The Witcher 3: Wild Hunt")
        XCTAssertEqual(sut.getGameWithId()?.backgroundImage, "https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg")
    }
}

extension AddNoteUnitTest: AddNoteViewModelDelegate {
    func gamesLoaded() {
        fetchExpectation.fulfill()
    }
    
    func gamesFailed(error: Error) {}
    func preFetch() {}
    func postFetch() {}
}
