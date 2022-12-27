//
//  MovieListViewController.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import UIKit

protocol MovieListViewControllerProtocol: AnyObject {
    func showMovies()
    func showAlert(error: Error)
}

final class MovieListViewController: UIViewController, MovieListViewControllerProtocol {
    @IBOutlet weak var movieTableView: UITableView! {
        didSet {
            movieTableView.delegate = self
            movieTableView.dataSource = self
        }
    }
    
    var presenter: MovieListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateView()
    }

    func showMovies() {
        movieTableView.reloadData()
    }
    
    func showAlert(error: Error) {
        //Showing alert
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell, let model = presenter.getMovie(index: indexPath.row) else { return UITableViewCell() }
        cell.configureCell(movie: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetail(index: indexPath.row)
    }
}

