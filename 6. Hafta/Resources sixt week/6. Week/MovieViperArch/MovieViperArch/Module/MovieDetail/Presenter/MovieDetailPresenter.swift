//
//  MovieDetailPresenter.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import Foundation

protocol MovieDetailPresenterProtocol: AnyObject {
    func updateView()
    func getMovieImageURL() -> URL
    func getMovieTitle() -> String
    func getMovieTagline() -> String
}

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    weak var view: MovieDetailViewControllerProtocol?
    var interactor: MovieDetailInteractorProtocol!
    var router: MovieDetailRouterProtocol!
    
    private var movie: MovieDetailModel?
    var movieId: Int?
    
    func updateView() {
        guard let movieId = movieId else { return }
        interactor.fetchMovieDetail(id: movieId)
    }
    
    func getMovieImageURL() -> URL {
        URL(string: MovieDBClient.IMAGE_BASE_URL + (movie?.poster ?? ""))!
    }
    
    func getMovieTitle() -> String {
        movie?.title ?? ""
    }
    
    func getMovieTagline() -> String {
        movie?.tagline ?? ""
    }
}

extension MovieDetailPresenter: MovieDetailInteractorDelegate {
    func onSuccessFetch(res: MovieDetailModel) {
        movie = res
        view?.showMovieDetail()
    }
    
    func onErrorFetch(error: Error) {
        view?.showAlert(error: error)
    }
}
