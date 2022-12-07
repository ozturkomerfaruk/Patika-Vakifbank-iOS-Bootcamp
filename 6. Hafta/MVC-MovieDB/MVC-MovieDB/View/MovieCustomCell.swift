//
//  MovileCustomCell.swift
//  MVC-MovieDB
//
//  Created by Ömer Faruk Öztürk on 6.12.2022.
//

import UIKit
import AlamofireImage

class MovieCustomCell: UITableViewCell {

    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    func configureCell(model: MovieModel) {
        guard let url = URL(string: Client.IMAGE_BASE_URL + model.poster) else { return }
        
        movieImage.af.setImage(withURL: url)
        movieTitle.text = model.title
    }

}
