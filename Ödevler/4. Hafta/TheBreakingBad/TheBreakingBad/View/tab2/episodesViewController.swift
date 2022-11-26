//
//  episodesViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit

final class EpisodesViewController: BaseViewController {
    
    //MARK: Values
    @IBOutlet private weak var episodesTableView: UITableView!
    private var commercialPopup: PopUp!
    private var episodes: [EpisodeModel]? {
        didSet {
            episodesTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        Client.getEpisodes { [weak self] episodes, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.episodes = episodes
        }
        
        configureTableView()
    }
    
    //MARK: Configure TableView
    private func configureTableView() {
        episodesTableView.delegate = self
        episodesTableView.dataSource = self
        episodesTableView.register(UINib.init(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: "episodesCustomCell")
    }

}

//MARK: Tableview Delegate & DataSource
extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Custom Cell
        guard let cell = episodesTableView.dequeueReusableCell(withIdentifier: "episodesCustomCell", for: indexPath) as? EpisodesTableViewCell,
              let model = episodes?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: Delegate Control for Function
        self.didTapped()
        NotificationCenter.default.post(name: NSNotification.Name("castEpisode"), object: episodes?[indexPath.row].characters ?? [])
    }
}

extension EpisodesViewController: popUpProtocol {
    
    //Closing with delegate
    internal func didTapped() {
        self.commercialPopup = PopUp(frame: self.view.frame)
        self.commercialPopup.closeOutlet.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        self.view.addSubview(commercialPopup)
    }
    
    //Close Action
    @objc internal func closeBtnTapped() {
        self.commercialPopup.removeFromSuperview()
        print("It is now clsoed!")
    }
}
