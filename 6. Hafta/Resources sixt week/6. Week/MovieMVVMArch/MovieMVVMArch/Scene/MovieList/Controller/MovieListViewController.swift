//
//  MovieListViewController.swift
//  MovieMVVMArch
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import UIKit

final class MovieListViewController: UIViewController {
    @IBOutlet private weak var movieListTableView: UITableView! {
        didSet {
            movieListTableView.delegate = self
            movieListTableView.dataSource = self
        }
    }
    
    private var viewModel: MovieListViewModelProtocol = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchPopularMovies()
    }
}

extension MovieListViewController: MovieListViewModelDelegate {    
    func moviesLoaded() {
        movieListTableView.reloadData()
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieTableViewCell, let model = viewModel.getMovie(at: indexPath.row) else { return UITableViewCell() }
        cell.configureCell(movie: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else { return }
        detailVC.movieId = viewModel.getMovieId(at: indexPath.row)
        present(detailVC, animated: true)
    }
}

