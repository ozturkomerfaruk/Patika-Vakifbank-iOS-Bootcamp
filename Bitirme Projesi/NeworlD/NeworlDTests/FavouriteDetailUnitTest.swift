//
//  FavouriteDetailUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//

import XCTest
@testable import NeworlD

final class FavouriteDetailUnitTest: XCTestCase {
    var sut: FavouriteDetailViewModel!
    var fetchExpectation: XCTestExpectation!

    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = FavouriteDetailViewModel()
        sut.delegate = self
        fetchExpectation = expectation(description: "favouriteDetail")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetLblName() {
        XCTAssertNil(sut.getLblName())
        
        sut.fetchFavouriteGameDetail(gameId: 22509)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getLblName(), "Minecraft")
    }
    
    func testGetImgGame() {
        XCTAssertEqual(sut.getImgGame(), "https://thumbs.dreamstime.com/z/oops-sticky-note-yellow-pinned-red-push-pin-cork-board-92680037.jpg")
        
        sut.fetchFavouriteGameDetail(gameId: 22509)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getImgGame(), "https://media.rawg.io/media/games/b4e/b4e4c73d5aa4ec66bbf75375c4847a2b.jpg")
    }
    
    func testGetLblRelease() {
        XCTAssertNil(sut.getLblRelease())
        
        sut.fetchFavouriteGameDetail(gameId: 22509)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getLblRelease(), "Jan 05, 2009")
    }
    
    func testGetLblUserReviews() {
        XCTAssertEqual(sut.getLblUserReviews(), " | -1 User Reviews")
        
        sut.fetchFavouriteGameDetail(gameId: 22509)
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(sut.getLblUserReviews(), "Exceptional | 1410 User Reviews")
    }
}

extension FavouriteDetailUnitTest: FavouriteDetailViewModelDelegate {
    func gameLoaded() {
        fetchExpectation.fulfill()
    }
    
    func gameFailed(error: Error) {}
    func preFetch() {}
    
}
