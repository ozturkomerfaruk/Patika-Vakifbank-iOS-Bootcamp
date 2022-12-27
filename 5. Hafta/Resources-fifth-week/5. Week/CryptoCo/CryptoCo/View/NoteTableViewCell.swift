//
//  NoteTableViewCell.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 26.11.2022.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {

    @IBOutlet private weak var noteLabel: UILabel!
    
    func configureCell(model: Note) {
        noteLabel.text = model.noteText
    }
}
