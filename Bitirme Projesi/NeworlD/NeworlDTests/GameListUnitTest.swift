//
//  NeworlDTests.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 8.12.2022.
//

import XCTest
@testable import NeworlD

final class GameListUnitTest: XCTestCase {
    var sut: GameListViewModel!
    var fetchExpectation: XCTestExpectation!

    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = GameListViewModel()
        sut.delegate = self
        fetchExpectation = expectation(description: "fetchGameList")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetGameListCount() throws {
        XCTAssertEqual(sut.getGameListCount(), 0)

        sut.fetchGameList()
        waitForExpectations(timeout: 10)

        XCTAssertEqual(sut.getGameListCount(), 20)
    }
    
    func testGetFirstGameList() throws {
        XCTAssertNil(sut.getGame(at: 0))
        
        sut.fetchGameList()
        waitForExpectations(timeout: 10)
        
        let firstItem = sut.getGame(at: 0)
        XCTAssertEqual(firstItem?.id, 3498)
        XCTAssertEqual(firstItem?.slug, "grand-theft-auto-v")
        XCTAssertEqual(firstItem?.name, "Grand Theft Auto V")
        XCTAssertEqual(firstItem?.released, "2013-09-17")
        XCTAssertEqual(firstItem?.backgroundImage, "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg")
        XCTAssertEqual(firstItem?.rating, 4.47)
        XCTAssertEqual(firstItem?.parentPlatforms.first?.platform.id, 1)
        XCTAssertEqual(firstItem?.parentPlatforms.first?.platform.name, "PC")
        XCTAssertEqual(firstItem?.parentPlatforms.first?.platform.slug, "pc")
        XCTAssertEqual(firstItem?.genres.first?.id, 4)
        XCTAssertEqual(firstItem?.genres.first?.name, "Action")
        XCTAssertEqual(firstItem?.genres.first?.slug, "action")
        XCTAssertEqual(firstItem?.stores.first?.id, 290375)
        XCTAssertEqual(firstItem?.stores.first?.store.id, 3)
        XCTAssertEqual(firstItem?.stores.first?.store.name, "PlayStation Store")
        XCTAssertEqual(firstItem?.stores.first?.store.slug, "playstation-store")
        XCTAssertEqual(firstItem?.tags.first?.id, 31)
        XCTAssertEqual(firstItem?.tags.first?.name, "Singleplayer")
        XCTAssertEqual(firstItem?.tags.first?.slug, "singleplayer")
        XCTAssertEqual(firstItem?.tags.first?.language, "eng")
        XCTAssertEqual(firstItem?.tags.first?.gamesCount, 193456)
        XCTAssertEqual(firstItem?.shortScreenshots.first?.id, -1)
        XCTAssertEqual(firstItem?.shortScreenshots.first?.image, "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg")
    }
    
}

extension GameListUnitTest: GameListViewModelDelegate {
    func gamesLoaded() {
        fetchExpectation.fulfill()
    }
    
    func gamesFailed(error: Error) {}
    func preFetch() {}
    func preSearchText() {}
}
