//
//  SelectEpisodeView.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 2.12.2022.
//

import UIKit

final class SelectEpisodeView: UIView {
    
    @IBOutlet private weak var episodeTableView: UITableView!
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
    
    weak var delegate: EpisodeViewDelegate?
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        
        let nib = UINib(nibName: "SelectEpisodeView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
        clientEpisode()
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
        //self custom cell
        self.episodeTableView.register(UINib(nibName: "NoteEpisodeCustomCell", bundle: nil), forCellReuseIdentifier: "noteEpisodeCustomCell")
    }
    
    @IBAction func closeView(_ sender: Any) {
        removeFromSuperview()
        delegate?.closeView()
    }
    
    private func clientEpisode() {
        Client.getEpisodes { [weak self] episodes, error in
            guard let self = self else { return }
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
            self.episodeTableView.reloadData()
        }
    }
}

extension SelectEpisodeView: UITableViewDataSource, UITableViewDelegate {
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
        guard let cell = episodeTableView.dequeueReusableCell(withIdentifier: "noteEpisodeCustomCell", for: indexPath) as? NoteEpisodeCustomCell
        else {
            return UITableViewCell()
        }
        let model = seasonEpisodes[indexPath.section].episodeModelList[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 1.0) {
            let model = self.seasonEpisodes[indexPath.section].episodeModelList[indexPath.row]
            self.delegate?.getModelTableView(episodeModel: model)
            print("Delegate Pressed")
            self.removeFromSuperview()
        }
    }
}
