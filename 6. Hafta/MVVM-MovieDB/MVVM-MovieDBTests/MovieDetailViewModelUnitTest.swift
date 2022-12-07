//
//  MovieDetailViewModelUnitTest.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import XCTest

final class MovieDetailViewModelUnitTest: XCTestCase {
    var viewModel: MovieDetailViewModel!
    var detailExpectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        //Given
        viewModel = MovieDetailViewModel()
        detailExpectation = expectation(description: "fetchMovieDetail")
        viewModel.delegate = self
    }

    func testGetMovieImageURL() throws {
        XCTAssertEqual(viewModel.getMovieImageURL()?.absoluteString, "https://image.tmdb.org/t/p/original")
        
        //When
        viewModel.fetchMovieDetail(id: 436270)
        waitForExpectations(timeout: 10)
        
        //Then
        XCTAssertEqual(viewModel.getMovieImageURL()?.absoluteString, "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg")
    }

    func testGetMovieTitle() {
        XCTAssertEqual(viewModel.getMovieTitle(), "")
        
        //When
        viewModel.fetchMovieDetail(id: 436270)
        waitForExpectations(timeout: 10)
        
        //Then
        XCTAssertEqual(viewModel.getMovieTitle(), "Black Adam")
    }
    
    func testGetMovieTagline() {
        XCTAssertEqual(viewModel.getMovieTagline(), "")
        
        //When
        viewModel.fetchMovieDetail(id: 436270)
        waitForExpectations(timeout: 10)
        
        //Then
        XCTAssertEqual(viewModel.getMovieTagline(), "The world needed a hero. It got Black Adam.")
    }
}

extension MovieDetailViewModelUnitTest: DetailMovieViewModelDelegate {
    func movieLoaded() {
        detailExpectation.fulfill()
    }
}
