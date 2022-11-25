//
//  episodesViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

final class EpisodesViewController: BaseViewController {
    
    @IBOutlet private weak var episodesTableView: UITableView!
    
    var commercialPopup: PopUp!
    
    private var episodes: [EpisodeModel]? {
        didSet {
            episodesTableView.reloadData()
        }
    }
    
    var seasonArr: [[String: EpisodeModel]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        
        Client.getEpisodes { [weak self] episodes, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.episodes = episodes
            for model in episodes! {
                self.seasonArr.append([model.season : model])
            }
        }
        print(seasonArr)
        configureTableView()
    }
    
    private func configureTableView() {
        episodesTableView.delegate = self
        episodesTableView.dataSource = self
        episodesTableView.register(UINib.init(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: "episodesCustomCell")
    }

}

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = episodesTableView.dequeueReusableCell(withIdentifier: "episodesCustomCell", for: indexPath) as? EpisodesTableViewCell,
              let model = episodes?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didTapped()
        NotificationCenter.default.post(name: NSNotification.Name("castEpisode"), object: episodes?[indexPath.row].characters ?? [])
    }
}

extension EpisodesViewController: popUpProtocol {
    
    func didTapped() {
        self.commercialPopup = PopUp(frame: self.view.frame)
        self.commercialPopup.closeOutlet.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        self.view.addSubview(commercialPopup)
    }
    
    @objc func closeBtnTapped() {
        self.commercialPopup.removeFromSuperview()
        print("It is now clsoed!")
    }
}
