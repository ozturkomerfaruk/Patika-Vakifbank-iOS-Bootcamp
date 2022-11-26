//
//  EpisodesTableViewCell.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

final class EpisodesTableViewCell: UITableViewCell {
    
    //MARK: Values
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var seasonLabel: UILabel!
    //MARK: ConfigureCell
    func configureCell(model: EpisodeModel) {
        nameLabel.text = model.title
        dateLabel.text = model.airDate.formattedDateFromString(dateString: model.airDate, withFormat: "MMM dd, yyyy")
        seasonLabel.text = "Episode: \(model.episode)"
    }
}

//MARK: Date Format
extension String {
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM-dd-yyyy"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }
        return nil
    }
}
