//
//  EpisodeListViewModelProtocol.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import Foundation

protocol EpisodeListViewModelProtocol {
    var delegate: EpisodeListVCDelegate? { get set }
    var allEpisodes: [EpisodeListResponse] { get set }
    
    func viewDidLoad()
    func fetchEpisodeList()
}

enum EpisodeListVCOutput {
    case fetchedEpisodes
}

protocol EpisodeListVCDelegate {
    func handle(output: EpisodeListVCOutput)
}
