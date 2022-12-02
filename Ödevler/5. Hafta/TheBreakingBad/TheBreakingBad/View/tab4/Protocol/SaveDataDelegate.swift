//
//  SaveDataDelegate.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

protocol NewNoteViewDelegate: AnyObject {
    func saveCoreData(tvSeries: String, noteText: String, image: UIImage, episode: String)
}
