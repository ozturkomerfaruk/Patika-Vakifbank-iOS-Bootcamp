//
//  EpisodesTableViewCell.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 23.11.2022.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeTextField: UILabel!
    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var dateTextField: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var episode: EpisodeModel? {
        didSet {
            configureComponents()
        }
    }
    
    // configures components
    func configureComponents() {
        episodeTextField.text = "Episode: \(episode?.episode ?? "")"
        titleTextField.text = episode?.title
        dateTextField.text = episode?.airDate
        containerView.layer.cornerRadius = 10
        
        containerView.layer.cornerRadius = 15
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 15
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.masksToBounds = false
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
