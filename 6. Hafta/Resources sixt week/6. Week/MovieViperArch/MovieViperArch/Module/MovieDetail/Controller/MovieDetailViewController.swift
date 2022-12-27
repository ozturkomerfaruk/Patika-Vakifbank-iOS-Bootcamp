//
//  MovieDetailViewController.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import UIKit

protocol MovieDetailViewControllerProtocol: AnyObject {
    func showMovieDetail()
    func showAlert(error: Error)
}

final class MovieDetailViewController: UIViewController, MovieDetailViewControllerProtocol {
    @IBOutlet private weak var movieTaglineLabel: UILabel!
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    var presenter: MovieDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
    }
    
    func showMovieDetail() {
        movieTitleLabel.text = presenter.getMovieTitle()
        movieTaglineLabel.text = presenter.getMovieTagline()
        movieImageView.af.setImage(withURL: presenter.getMovieImageURL())
    }
    
    func showAlert(error: Error) {
        //Show Alert
    }
}
