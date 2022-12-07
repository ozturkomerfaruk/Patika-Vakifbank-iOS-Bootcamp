//
//  ViewController.swift
//  MVC-MovieDB
//
//  Created by Ömer Faruk Öztürk on 6.12.2022.
//

import UIKit

class MovieVC: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    var movies: [MovieModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Client.getPopularMovies { [weak self] movies, error in
            guard let self = self else { return }
            self.movies = movies
            self.moviesTableView.reloadData()
        }
        
        prepareTableView()
    }

    private func prepareTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
}

extension MovieVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCustomCell", for: indexPath) as? MovieCustomCell,
              let model = movies?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item Selected \(indexPath.row)")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "movieDetailVC") as? MovieDetailVC, let movieID = movies?[indexPath.row].id else { return }
        vc.movieId = movieID
        print(vc.movieId)
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
