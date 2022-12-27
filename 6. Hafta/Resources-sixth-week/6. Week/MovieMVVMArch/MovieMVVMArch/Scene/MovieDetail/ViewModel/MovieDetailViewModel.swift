//
//  MovieDetailViewModel.swift
//  MovieMVVMArch
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func fetchMovieDetail(id: Int)
    func getMovieImageURL() -> URL?
    func getMovieTitle() -> String
    func getMovieTagline() -> String
}

protocol MovieDetailViewModelDelegate: AnyObject {
    func movieLoaded()
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    weak var delegate: MovieDetailViewModelDelegate?
    private var movie: MovieDetailModel?
    
    func fetchMovieDetail(id: Int) {
        MovieDBClient.getMovieDetail(movieId: id) { [weak self] movieDetail, error in
            guard let self = self else { return }
            self.movie = movieDetail
            self.delegate?.movieLoaded()
        }
    }
    
    func getMovieImageURL() -> URL? {
        URL(string: MovieDBClient.IMAGE_BASE_URL + (movie?.poster ?? ""))
    }
    
    func getMovieTitle() -> String {
        movie?.title ?? ""
    }
    
    func getMovieTagline() -> String {
        movie?.tagline ?? ""
    }
}
