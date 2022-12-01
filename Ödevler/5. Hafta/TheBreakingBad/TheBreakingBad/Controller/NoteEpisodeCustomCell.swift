//
//  NoteEpisodeCustomCell.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

final class NoteEpisodeCustomCell: UITableViewCell {
    
    @IBOutlet private weak var num: UILabel!
    @IBOutlet private weak var title: UILabel!
    
    func configureCell(model: EpisodeModel) {
        self.num.text = model.episode + "."
        self.title.text = model.title
    }
}
