//
//  MovieTableViewCell.swift
//  MovieMVCPattern
//
//  Created by Kaan YILDIRIM on 3.12.2022.
//

import UIKit
import AlamofireImage

final class MovieTableViewCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    func configureCell(model: MovieModel) {
        guard let url = URL(string: MovieDBClient.IMAGE_BASE_URL + model.poster) else { return }
        movieTitle.text = model.title
        movieImage.af.setImage(withURL: url)
    }
}
