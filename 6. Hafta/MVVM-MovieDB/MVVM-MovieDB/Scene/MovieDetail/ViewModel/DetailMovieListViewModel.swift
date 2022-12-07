//
//  DetailMovieListViewModel.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import Foundation

protocol DetailMovieViewModelProtocol {
    var delegate: DetailMovieViewModelDelegate? { get set }
    
    func fetchMovieDetail(id: Int)
    func getMovieImageURL() -> URL?
    func getMovieTitle() -> String
    func getMovieTagline() -> String
}

protocol DetailMovieViewModelDelegate: AnyObject {
    func movieLoaded()
    //MVC de error tarafına değindim buranın
}

final class DetailMovieViewModel: DetailMovieViewModelProtocol {
    weak var delegate: DetailMovieViewModelDelegate?
    private var viewModelMovie: MovieDetailModel?
    
    func fetchMovieDetail(id: Int) {
        Client.getMovieDetail(moveId: id) { [weak self] viewModelDetail, error in
            guard let self = self else { return }
            self.viewModelMovie = viewModelDetail
            self.delegate?.movieLoaded()
        }
    }
    
    func getMovieImageURL() -> URL? {
        URL(string: Client.IMAGE_BASE_URL + (viewModelMovie?.poster ?? ""))
    }
    
    func getMovieTitle() -> String {
        viewModelMovie?.title ?? ""
    }
    
    func getMovieTagline() -> String {
        viewModelMovie?.tagline ?? ""
    }
    
    
}
