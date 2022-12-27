//
//  MovieDetailViewController.swift
//  MovieMVVMArch
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    @IBOutlet private weak var movieTaglineLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    var movieId: Int?
    private var viewModel: MovieDetailViewModelProtocol = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = movieId else { return }
        viewModel.delegate = self
        viewModel.fetchMovieDetail(id: id)
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func movieLoaded() {
        movieTaglineLabel.text = viewModel.getMovieTagline()
        movieTitleLabel.text = viewModel.getMovieTitle()
        guard let url = viewModel.getMovieImageURL() else { return }
        movieImageView.af.setImage(withURL: url)
    }
}
