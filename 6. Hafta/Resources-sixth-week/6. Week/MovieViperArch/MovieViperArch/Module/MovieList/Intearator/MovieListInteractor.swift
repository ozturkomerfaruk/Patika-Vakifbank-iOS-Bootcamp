//
//  MovieListInteractor.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import Foundation

protocol MovieListInteractorProtocol: AnyObject {
    func fetchPopularMovies()
}

protocol MovieListInteractorDelegate: AnyObject {
    func onSuccessFetch(res: [MovieModel])
    func onErrorFetch(error: Error)
}

final class MovieListInteractor: MovieListInteractorProtocol {
    weak var presenter: MovieListInteractorDelegate!
    
    func fetchPopularMovies() {
        MovieDBClient.getPopularMovies { movies, error in
            if let error = error {
                self.presenter.onErrorFetch(error: error)
            } else if let movies = movies {
                self.presenter.onSuccessFetch(res: movies)
            }
        }
    }
}
