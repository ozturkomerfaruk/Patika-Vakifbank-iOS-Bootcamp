//
//  MovieDetailVC.swift
//  MVC-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    @IBOutlet private weak var movieTagLine: UILabel!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieImage: UIImageView!
    
    var movieId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let id = movieId else { return }
        Client.getMovieDetail(moveId: id) { [weak self] model, error in
            guard let self = self,
            let urlString = URL(string: "\(Client.IMAGE_BASE_URL)\(model!.poster)") else { return }
            self.movieTitle.text = model?.title
            self.movieTagLine.text = model?.tagline
            self.movieImage.af.setImage(withURL: urlString)
        }
    }
}
