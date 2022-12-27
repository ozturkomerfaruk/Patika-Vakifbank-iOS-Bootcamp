//
//  MovieTableViewCell.swift
//  MovieMVVMArch
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import UIKit
import AlamofireImage

final class MovieTableViewCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    func configureCell(movie: MovieModel) {
        movieTitle.text = movie.title
        guard let url = URL(string: MovieDBClient.IMAGE_BASE_URL + movie.poster) else { return }
        movieImage.af.setImage(withURL: url)
    }
    
    override func prepareForReuse() {
        movieImage.image = nil
    }
}
