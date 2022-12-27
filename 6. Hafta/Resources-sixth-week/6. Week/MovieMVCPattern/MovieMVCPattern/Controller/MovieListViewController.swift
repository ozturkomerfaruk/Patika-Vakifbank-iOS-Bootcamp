//
//  MovieListViewController.swift
//  MovieMVCPattern
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import UIKit

final class MovieListViewController: UIViewController {
    @IBOutlet private weak var moviesTableView: UITableView!
    private var movies: [MovieModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        fetchMovies()
    }
    
    private func fetchMovies() {
        MovieDBClient.getPopularMovies { [weak self] movies, error in
            guard let self = self else { return }
            self.movies = movies
            self.moviesTableView.reloadData()
        }
    }
    
    private func prepareTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell, let model = movies?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController, let movieId = movies?[indexPath.row].id else { return }
        detailVC.movieId = movieId
        present(detailVC, animated: true)
    }
}

