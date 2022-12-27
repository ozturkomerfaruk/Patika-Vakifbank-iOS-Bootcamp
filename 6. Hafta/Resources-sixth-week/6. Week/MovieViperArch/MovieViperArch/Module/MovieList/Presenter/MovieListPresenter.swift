//
//  MovieListPresenter.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import Foundation

protocol MovieListPresenterProtocol: AnyObject {
    func updateView()
    func showDetail(index: Int)
    func getMovieCount() -> Int
    func getMovie(index: Int) -> MovieModel?
}

final class MovieListPresenter: MovieListPresenterProtocol {
    weak var view: MovieListViewControllerProtocol?
    var interactor: MovieListInteractorProtocol!
    var router: MovieListRouterProtocol!
    
    private var movies: [MovieModel]?
    
    func updateView() {
        interactor.fetchPopularMovies()
    }
    
    func showDetail(index: Int) {
        guard let id = movies?[index].id else { return }
        router.navigateToDetail(id: id)
    }
    
    func getMovieCount() -> Int {
        movies?.count ?? 0
    }
    
    func getMovie(index: Int) -> MovieModel? {
        movies?[index]
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func onSuccessFetch(res: [MovieModel]) {
        movies = res
        view?.showMovies()
    }
    
    func onErrorFetch(error: Error) {
        view?.showAlert(error: error)
    }
}
