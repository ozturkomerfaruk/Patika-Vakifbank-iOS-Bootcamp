//
//  MovieDetailViewController.swift
//  MovieMVCPattern
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    @IBOutlet private weak var movieTaglineTitle: UILabel!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    
    var movieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = movieId else { return }
        getMovieDetail(id)
    }
    
    private func getMovieDetail(_ id: Int) {
        MovieDBClient.getMovieDetail(movieId: id) { [weak self] movieDetail, error in
            guard let self = self else { return }
            self.movieTaglineTitle.text = movieDetail?.tagline
            self.movieTitleLabel.text = movieDetail?.title
            guard let url = URL(string: MovieDBClient.IMAGE_BASE_URL + movieDetail!.poster) else { return }
            self.movieImageView.af.setImage(withURL: url)
        }
    }
}
