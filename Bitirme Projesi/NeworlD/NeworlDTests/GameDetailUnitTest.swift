//
//  GameDetailUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//

import XCTest
@testable import NeworlD

final class GameDetailUnitTest: XCTestCase {
    var sut: GameDetailViewModel!
    var fetchExpectation: XCTestExpectation!

    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = GameDetailViewModel()
        sut.delegate = self
        fetchExpectation = expectation(description: "fetchGameDetail")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetFavourites() {
        XCTAssertEqual(sut.getFavourites().count, 0)
        
        CoreDataManager.shared.saveFavourite(gameId: 999)
        sut.fetchFavourites()
        
        fetchExpectation.fulfill()
        waitForExpectations(timeout: 5)
        let lastIndex = sut.getFavourites().count - 1
        
        XCTAssertEqual(sut.getFavourites()[lastIndex].gameId, 999)
    }
    
    func testGetGameDetailDescriptionRow() throws {
        XCTAssertEqual(sut.getDescriptionRow(), "")

        sut.fetchGameDetail(id: 3328)
        waitForExpectations(timeout: 10)

        XCTAssertEqual(sut.getDescriptionRow(), "The third game in a series, it holds nothing back from the player. Open world adventures of the renowned monster slayer Geralt of Rivia are now even on a larger scale. Following the source material more accurately, this time Geralt is trying to find the child of the prophecy, Ciri while making a quick coin from various contracts on the side. Great attention to the world building above all creates an immersive story, where your decisions will shape the world around you.\n\nCD Project Red are infamous for the amount of work they put into their games, and it shows, because aside from classic third-person action RPG base game they provided 2 massive DLCs with unique questlines and 16 smaller DLCs, containing extra quests and items.\n\nPlayers praise the game for its atmosphere and a wide open world that finds the balance between fantasy elements and realistic and believable mechanics, and the game deserved numerous awards for every aspect of the game, from music to direction.")
    }
    
    func testGetPublisher() throws {
        XCTAssertEqual(sut.getPublisher(), "")
        
        sut.fetchGameDetail(id: 3328)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getPublisher(), "CD PROJEKT RED")
    }
    
    func testGetRatingTableCount() throws {
        XCTAssertEqual(sut.getRatingTableCount(), 0)
        
        sut.fetchGameDetail(id: 3328)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getRatingTableCount(), 4)
    }
    
    func testGetRating() throws {
        XCTAssertNil(sut.getRating(index: 0))
        
        sut.fetchGameDetail(id: 3328)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getRating(index: 0)?.id, 5)
        XCTAssertEqual(sut.getRating(index: 0)?.title, "exceptional")
        XCTAssertEqual(sut.getRating(index: 0)?.count, 4497)
        XCTAssertEqual(sut.getRating(index: 0)?.percent, 77.98)
    }
    
    func testGetWebsiteURLString() throws {
        XCTAssertNil(sut.getWebsiteURLString())
        
        sut.fetchGameDetail(id: 3328)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getWebsiteURLString(), "https://thewitcher.com/en/witcher3")
        
    }
}

extension GameDetailUnitTest: GameDetailViewModelDelegate {
    func gamesLoaded() {
        fetchExpectation.fulfill()
    }
    
    func gamesFailed(error: Error) {}
    func preFetch() {}
}
