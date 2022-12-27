//
//  EpisodeCell.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet private weak var episodeTitleLabel: UILabel!
    @IBOutlet private weak var episodeSeasonNumberLabel: UILabel!
    @IBOutlet private weak var episodeNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(with model: EpisodeListResponse) {
        guard let title = model.title,
              let seasonNumber = model.season,
              let episodeNumber = model.episode
        else { return }
        episodeTitleLabel.text = title
        episodeSeasonNumberLabel.text = seasonNumber
        episodeNumberLabel.text = episodeNumber
    }
}
