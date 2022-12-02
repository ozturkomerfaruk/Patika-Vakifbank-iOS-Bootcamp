//
//  EpisodeViewDelegate.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 2.12.2022.
//

import Foundation

protocol EpisodeViewDelegate: AnyObject {
    func getModelTableView(episodeModel: EpisodeModel)
    func closeView()
}
