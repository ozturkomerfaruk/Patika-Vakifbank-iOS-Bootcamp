//
//  EpisodeListVC.swift
//  BreakingBadApp
//
//  Created by Ufuk on 26.11.2022.
//

import UIKit

class EpisodeListVC: UIViewController {
    
    @IBOutlet private weak var episodeTableView: UITableView!

    var viewModel: EpisodeListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        viewModel?.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        let episodeCellName = String(describing: EpisodeCell.self)
        let episodeCellNib = UINib(nibName: episodeCellName, bundle: .main)
        episodeTableView.register(episodeCellNib, forCellReuseIdentifier: episodeCellName)
    }
}

extension EpisodeListVC: EpisodeListVCDelegate {
    func handle(output: EpisodeListVCOutput) {
        switch output {
        case .fetchedEpisodes:
            DispatchQueue.main.async {
                self.episodeTableView.reloadData()
            }
        }
    }
}

extension EpisodeListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let episodesCount = viewModel?.allEpisodes.count
        else { return 0 }
        return episodesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episode = viewModel?.allEpisodes[indexPath.row]
        else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeCell.self), for: indexPath) as? EpisodeCell {
            cell.config(with: episode)
            return cell
        }
        return UITableViewCell()
    }
}

extension EpisodeListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedEpisodeCharacter = viewModel?.allEpisodes[indexPath.row].characters,
              let frame = UIApplication.topViewController()?.view.frame
        else { return }
        //TODO: - EpoisodeView
        let episodeView = EpisodeCharacterView(frame: frame)
        episodeView.delegate = self
        episodeView.alpha = 0
        episodeView.config(with: selectedEpisodeCharacter)
        
        UIView.animate(withDuration: 0.25) { () -> Void in
            episodeView.alpha = 1.0
            UIApplication.topViewController()?.view.addSubview(episodeView)
        }
    }
}

extension EpisodeListVC: EpisodeCharacterViewDelegate {
    func close() {
        print("closed episode characters view")
    }
}
