//
//  MovieDetailVC.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import UIKit

class MovieDetailVC: UIViewController {

    
    
    @IBOutlet private weak var movieTagLine: UILabel!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    var movieId: Int?
    private var viewModel = DetailMovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let id = movieId else { return }
        viewModel.fetchMovieDetail(id: id)
        viewModel.delegate = self
    }
}

extension MovieDetailVC: DetailMovieViewModelDelegate {
    func movieLoaded() {
        movieTitle.text = viewModel.getMovieTitle()
        movieTagLine.text = viewModel.getMovieTagline()
        guard let url = viewModel.getMovieImageURL() else { return }
        movieImage.af.setImage(withURL: url)
    }
}
