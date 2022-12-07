//
//  MovieCustomCell.swift
//  MVVM-MovieDB
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import UIKit
import AlamofireImage

class MovieCustomCell: UITableViewCell {
    
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    func configureCell(model: MovieModel) {
        movieTitle.text = model.title
        guard let url = URL(string: Client.IMAGE_BASE_URL + model.poster) else { return }
        movieImage.af.setImage(withURL: url)
    }
    
    //Aynı celler kullanıldığı için reuse edilmeden kullanılan method
    override func prepareForReuse() {
        movieImage.image = nil
    }
}
