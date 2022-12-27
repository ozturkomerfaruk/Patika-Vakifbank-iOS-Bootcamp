//
//  MovieDetailInteractor.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import Foundation

protocol MovieDetailInteractorProtocol: AnyObject {
    func fetchMovieDetail(id: Int)
}

protocol MovieDetailInteractorDelegate: AnyObject {
    func onSuccessFetch(res: MovieDetailModel)
    func onErrorFetch(error: Error)
}

final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    weak var presenter: MovieDetailInteractorDelegate!
    
    func fetchMovieDetail(id: Int) {
        MovieDBClient.getMovieDetail(movieId: id) { [weak self] movieDetail, error in
            guard let self = self else { return }
            if let error = error {
                self.presenter.onErrorFetch(error: error)
            } else if let movieDetail = movieDetail {
                self.presenter.onSuccessFetch(res: movieDetail)
            }
        }
    }
}
