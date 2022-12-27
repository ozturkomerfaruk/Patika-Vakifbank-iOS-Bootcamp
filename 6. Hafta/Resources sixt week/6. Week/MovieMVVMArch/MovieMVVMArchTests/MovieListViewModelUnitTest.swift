//
//  MovieListViewModelUnitTest.swift
//  MovieMVVMArchTests
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import XCTest

final class MovieListViewModelUnitTest: XCTestCase {
    var viewModel: MovieListViewModel!
    var fetchExpectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        viewModel = MovieListViewModel()
        viewModel.delegate = self
        fetchExpectation = expectation(description: "fetchMovies")
    }

    func testGetMovieCount() throws {
        //Given
        XCTAssertEqual(viewModel.getMovieCount(), 0)
        
        //When
        viewModel.fetchPopularMovies()
        waitForExpectations(timeout: 10)
        
        //Then
        XCTAssertEqual(viewModel.getMovieCount(), 20)
    }
    
    func testGetMovieIndexZero() {
        XCTAssertNil(viewModel.getMovie(at: 0))
        
        viewModel.fetchPopularMovies()
        waitForExpectations(timeout: 10)
        
        let itemAtZero = viewModel.getMovie(at: 0)
        XCTAssertEqual(itemAtZero?.id, 436270)
        XCTAssertEqual(itemAtZero?.title, "Black Adam")
        XCTAssertEqual(itemAtZero?.poster, "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg")
    }
    
    func testGetMovieIdIndexZero() {
        XCTAssertNil(viewModel.getMovieId(at: 0))
        
        viewModel.fetchPopularMovies()
        waitForExpectations(timeout: 10)
        
        XCTAssertEqual(viewModel.getMovieId(at: 0), 436270)
    }
}

extension MovieListViewModelUnitTest: MovieListViewModelDelegate {
    func moviesLoaded() {
        fetchExpectation.fulfill()
    }
}
