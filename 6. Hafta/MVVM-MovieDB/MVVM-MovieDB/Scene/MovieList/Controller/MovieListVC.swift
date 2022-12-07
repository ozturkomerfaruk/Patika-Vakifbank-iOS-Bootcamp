//
//  MovieListVC.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import UIKit

class MovieListVC: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView! {
        didSet {
            moviesTableView.delegate = self
            moviesTableView.dataSource = self
        }
    }
    
    private var viewModel = MovieListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPopularMovies()
        viewModel.delegate = self
    }


}

extension MovieListVC: MovieListViewModelDelegate {
    func moviesLoaded() {
        moviesTableView.reloadData()
    }
    
    func moviesFailed(error: Error) {
        print("ERRORRRRRR ALERT")
    }
}

extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCustomCell", for: indexPath) as? MovieCustomCell,
              let model = viewModel.getMovie(at: indexPath.row) else { return UITableViewCell() }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailMovieVC") as? MovieDetailVC else { return }
        vc.movieId = viewModel.getMovieId(at: indexPath.row)
        present(vc, animated: true)
    }
}

