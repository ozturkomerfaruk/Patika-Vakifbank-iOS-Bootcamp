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
    private var customPopup: PopUp!
    private var seasonEpisodes = [SeasonEpisodeModel]()
    
    //seasons
    private var bd1Model: SeasonEpisodeModel?
    private var bd2Model: SeasonEpisodeModel?
    private var bd3Model: SeasonEpisodeModel?
    private var bd4Model: SeasonEpisodeModel?
    private var bd5Model: SeasonEpisodeModel?
    private var bcs1Model: SeasonEpisodeModel?
    private var bcs2Model: SeasonEpisodeModel?
    private var bcs3Model: SeasonEpisodeModel?
    private var bcs4Model: SeasonEpisodeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episodes"
        indicator.startAnimating()
        Client.getEpisodes { [weak self] episodes, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            //self.episodes = episodes
            
            //I want to seperated by season
            self.bd1Model = SeasonEpisodeModel(seasonName: "Breaking Bad Season 1", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "1" && model.series == "Breaking Bad"
            })) ?? [])
            self.bd2Model = SeasonEpisodeModel(seasonName: "Breaking Bad Season 2", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "2" && model.series == "Breaking Bad"
            })) ?? [])
            self.bd3Model = SeasonEpisodeModel(seasonName: "Breaking Bad Season 3", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "3" && model.series == "Breaking Bad"
            })) ?? [])
            self.bd4Model = SeasonEpisodeModel(seasonName: "Breaking Bad Season 4", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "4" && model.series == "Breaking Bad"
            })) ?? [])
            self.bd5Model = SeasonEpisodeModel(seasonName: "Breaking Bad Season 5", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "5" && model.series == "Breaking Bad"
            })) ?? [])
            self.bcs1Model = SeasonEpisodeModel(seasonName: "Better Call Saul Season 1", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "1" && model.series == "Better Call Saul"
            })) ?? [])
            self.bcs2Model = SeasonEpisodeModel(seasonName: "Better Call Saul Season 2", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "2" && model.series == "Better Call Saul"
            })) ?? [])
            self.bcs3Model = SeasonEpisodeModel(seasonName: "Better Call Saul Season 3", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "3" && model.series == "Better Call Saul"
            })) ?? [])
            self.bcs4Model = SeasonEpisodeModel(seasonName: "Better Call Saul Season 4", episodeModelList: (episodes?.filter({ model in
                return model.season.trimmingCharacters(in: .whitespacesAndNewlines) == "4" && model.series == "Better Call Saul"
            })) ?? [])
            
            
            self.seasonEpisodes.append(self.bd1Model!)
            self.seasonEpisodes.append(self.bd2Model!)
            self.seasonEpisodes.append(self.bd3Model!)
            self.seasonEpisodes.append(self.bd4Model!)
            self.seasonEpisodes.append(self.bd5Model!)
            self.seasonEpisodes.append(self.bcs1Model!)
            self.seasonEpisodes.append(self.bcs2Model!)
            self.seasonEpisodes.append(self.bcs3Model!)
            self.seasonEpisodes.append(self.bcs4Model!)
            self.episodesTableView.reloadData()
        }
        print(seasonEpisodes.count)
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
    
    //Section Count
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasonEpisodes.count
    }
    
    //Section Name
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return seasonEpisodes[section].seasonName
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonEpisodes[section].episodeModelList.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Custom Cell
        guard let cell = episodesTableView.dequeueReusableCell(withIdentifier: "episodesCustomCell", for: indexPath) as? EpisodesTableViewCell
        else {
            return UITableViewCell()
        }
        let model = seasonEpisodes[indexPath.section].episodeModelList[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: Delegate Control for Function
        self.didTapped()
        NotificationCenter.default.post(name: NSNotification.Name("castEpisode"), object: seasonEpisodes[indexPath.section].episodeModelList[indexPath.row].characters)
    }
}

extension EpisodesViewController: popUpProtocol {
    
    //Closing with delegate
    internal func didTapped() {
        self.customPopup = PopUp(frame: self.view.frame)
        self.customPopup.closeOutlet.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        self.view.addSubview(customPopup)
    }
    
    //Close Action
    @objc internal func closeBtnTapped() {
        self.customPopup.removeFromSuperview()
        print("It is now clsoed!")
    }
}
