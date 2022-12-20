//
//  FavouriteListUnitTest.swift
//  NeworlDTests
//
//  Created by Ömer Faruk Öztürk on 17.12.2022.
//
 
import XCTest
@testable import NeworlD

final class FavouriteListUnitTest: XCTestCase {

    
    var sut: FavouriteListViewModel!
    
    //Given -> When -> Then
    override func setUpWithError() throws {
        sut = FavouriteListViewModel()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testGetFavouritesCount() {
        XCTAssertEqual(sut.getFavouritesCount(), 0)
        
        CoreDataManager.shared.saveFavourite(gameId: 999)
        sut.fetchFavourites()
        
        XCTAssertNotEqual(sut.getFavouritesCount(), 0)
    }
    
    func testAppendFavourites() {
        XCTAssertEqual(sut.getFavouritesCount(), 0)
        
        CoreDataManager.shared.saveFavourite(gameId: 999)
        sut.fetchFavourites()
        var mockObject = FavouritesEntity()
        let lastIndex = sut.getFavouritesCount() - 1
        mockObject = sut.getFavourites(index: lastIndex)
        
        XCTAssertEqual(mockObject.gameId, 999)
    }
    
    func testDeleteFavourites() {
        CoreDataManager.shared.saveFavourite(gameId: 1)
        sut.fetchFavourites()
        var mockObject = FavouritesEntity()
        let lastIndex = sut.getFavouritesCount() - 1
        mockObject = sut.getFavourites(index: lastIndex)
        XCTAssertEqual(mockObject.gameId, 1)
        
        CoreDataManager.shared.deleteFavourite(favourite: mockObject)
        sut.fetchFavourites()
        
        XCTAssertNotEqual(mockObject.gameId, 1)
    }
    
    func testDeleteFavouritesFromArray() {
        var arr = [1,2,3]
        XCTAssertEqual(arr.count, 3)
        
        arr.remove(at: 0)
        
        XCTAssertEqual(arr.count, 2)
    }
    
    func testIsArrayEmpty() {
        XCTAssertEqual(sut.getFavouritesCount(), 0)
        
        CoreDataManager.shared.saveFavourite(gameId: -1)
        sut.fetchFavourites()
        
        XCTAssertNotEqual(sut.getFavouritesCount(), 0)
    }
}



/**/
