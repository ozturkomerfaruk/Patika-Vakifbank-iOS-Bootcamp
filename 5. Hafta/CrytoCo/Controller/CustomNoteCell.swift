//
//  CustomNoteCell.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 30.11.2022.
//

import UIKit

final class CustomNoteCell: UITableViewCell {

    @IBOutlet private weak var noteLabel: UILabel!
    
    func configureCell(model: Note) {
        noteLabel.text = model.noteText
    }
    
}
