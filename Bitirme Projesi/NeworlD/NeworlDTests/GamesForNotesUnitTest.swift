//
//  GamesForNotesUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//

import XCTest
@testable import NeworlD

final class GamesForNotesUnitTest: XCTestCase {
    var sut: GamesForNotesViewModel!
    var fetchExpectation: XCTestExpectation!

    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = GamesForNotesViewModel()
        sut.delegate = self
        fetchExpectation = expectation(description: "gamesForNotes")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetSearchGamesCount() {
        XCTAssertEqual(sut.getSearchGamesCount(), 0)
        
        sut.fetchSearchGames(searchGameName: "Minecraft")
        waitForExpectations(timeout: 10)
    
        XCTAssertEqual(sut.getSearchGamesCount(), 20)
    }
    
    func testGetSearchGame() {
        XCTAssertNil(sut.getSearchGame(at: 0))
        
        sut.fetchSearchGames(searchGameName: "Minecraft")
        waitForExpectations(timeout: 10)
        let game = sut.getSearchGame(at: 0)
        XCTAssertEqual(game?.id, 22509)
        XCTAssertEqual(game?.slug, "minecraft")
        XCTAssertEqual(game?.name, "Minecraft")
        XCTAssertEqual(game?.released, "2009-05-10")
        XCTAssertEqual(game?.backgroundImage, "https://media.rawg.io/media/games/b4e/b4e4c73d5aa4ec66bbf75375c4847a2b.jpg")
        XCTAssertEqual(game?.rating, 4.42)
        XCTAssertEqual(game?.parentPlatforms.first?.platform.id, 1)
        XCTAssertEqual(game?.parentPlatforms.first?.platform.name, "PC")
        XCTAssertEqual(game?.parentPlatforms.first?.platform.slug, "pc")
        XCTAssertEqual(game?.genres.first?.id, 4)
        XCTAssertEqual(game?.genres.first?.name, "Action")
        XCTAssertEqual(game?.genres.first?.slug, "action")
        XCTAssertEqual(game?.stores.first?.id, -1)
        XCTAssertEqual(game?.stores.first?.store.id, 3)
        XCTAssertEqual(game?.stores.first?.store.name, "PlayStation Store")
        XCTAssertEqual(game?.stores.first?.store.slug, "playstation-store")
        XCTAssertEqual(game?.tags.first?.id, 7)
        XCTAssertEqual(game?.tags.first?.name, "Multiplayer")
        XCTAssertEqual(game?.tags.first?.slug, "multiplayer")
        XCTAssertEqual(game?.tags.first?.language, "eng")
        XCTAssertEqual(game?.tags.first?.gamesCount, 34039)
        XCTAssertEqual(game?.shortScreenshots.first?.id, -1)
        XCTAssertEqual(game?.shortScreenshots.first?.image,
                       "https://media.rawg.io/media/games/b4e/b4e4c73d5aa4ec66bbf75375c4847a2b.jpg")
    }
}

extension GamesForNotesUnitTest: GamesForNotesViewModelDelegate {
    func gamesLoaded() {
        fetchExpectation.fulfill()
    }
    
    func gamesFailed(error: Error) {}
    func preFetch() {}
    func postFetch() {}
}
