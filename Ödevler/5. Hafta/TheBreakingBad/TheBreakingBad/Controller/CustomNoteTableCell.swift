//
//  CustomNoteTableCell.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

class CustomNoteTableCell: UITableViewCell {

    @IBOutlet private weak var tvSeries: UILabel!
    @IBOutlet private weak var episode: UILabel!
    
    func configureCell(model: EpisodeNote) {
        self.tvSeries.text = model.tvSeries
        self.episode.text = model.episode
    }
}
