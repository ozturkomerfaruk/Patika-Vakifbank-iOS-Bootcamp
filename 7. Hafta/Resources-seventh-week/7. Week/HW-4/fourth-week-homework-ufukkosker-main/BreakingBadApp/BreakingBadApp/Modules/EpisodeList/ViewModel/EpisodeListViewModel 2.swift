//
//  EpisodeListViewModel.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import Foundation

final class EpisodeListViewModel: EpisodeListViewModelProtocol {
    var delegate: EpisodeListVCDelegate?
    var allEpisodes: [EpisodeListResponse] = []
    private let dataProvider: EpisodeListDataProviderProtocol?
    
    init(dataProvider: EpisodeListDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        fetchEpisodeList()
    }
    
    func fetchEpisodeList() {
        LoadingManager.shared.show()
        dataProvider?.fetchAllEpisodes(request: .init(paths: [BreakingBadAPIConstant.episodes.rawValue]), completion: { result in
            LoadingManager.shared.hide()
            switch result {
            case .success(let response):
                self.allEpisodes = response
                self.notify(.fetchedEpisodes)
            case .failure(let error):
                print("foo err: \(error)")
            }
        })
    }
    
    private func notify(_ output: EpisodeListVCOutput) {
        delegate?.handle(output: output)
    }
}
