//
//  NewEpisodeNoteViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

final class NewEpisodeNoteViewController: UIViewController {
    
    @IBOutlet private weak var chooseTvSeriesOutlet: UIButton!
    @IBOutlet private var tvSeriesCollection: [UIButton]!
    @IBOutlet private weak var episodeTableView: UITableView!
    
    private var seasonEpisodes = [SeasonEpisodeModel]()
    
    @IBOutlet private weak var selectEpisodeOutlet: UIButton!
    
    @IBOutlet private weak var imageView: UIImageView!
    
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
        
        
        configure()
    }
    
    private func configure() {
        chooseTvSeriesOutlet.layer.cornerRadius = chooseTvSeriesOutlet.frame.height / 2
        tvSeriesCollection.forEach {
            btn in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden = true
            btn.alpha = 0
        }
        selectEpisodeOutlet.layer.cornerRadius = selectEpisodeOutlet.frame.height / 2
        clientEpisode()
        episodeTableView.alpha = 0
        episodeTableView.isHidden = true
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
        episodeTableView.register(UINib(nibName: "NoteEpisodeCustomCell", bundle: nil), forCellReuseIdentifier: "noteEpisodeCustomCell")
    }
    
    @IBAction func tvSeriesCollectionAction(_ sender: UIButton) {
        if let btn = sender.titleLabel?.text {
            chooseTvSeriesOutlet.setTitle(btn, for: .normal)
            tvSeriesCollection.forEach {
                btn in
                UIView.animate(withDuration: 0.8) {
                    btn.isHidden = true
                    btn.alpha = 0
                }
            }
        }
    }
    
    @IBAction func chooseTvSeriesOutletAction(_ sender: UIButton) {
        tvSeriesCollection.forEach {
            btn in
            UIView.animate(withDuration: 0.8) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
            }
        }
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
    
    
    @IBAction func selectEpisodeAction(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.episodeTableView.alpha = 1
            self.episodeTableView.isHidden = false
        }
    }
    
    @IBAction func takeAPhoto(_ sender: Any) {
       print("asdasd")
        showPhotoAlert()
    }
    
    private func showPhotoAlert() {
        let alert = UIAlertController(title: "Take Photo From", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.getPhoto(type: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func getPhoto(type: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
}

extension NewEpisodeNoteViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage else {
            print("Image Not Found!")
            return
        }
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension NewEpisodeNoteViewController: UITableViewDataSource, UITableViewDelegate {
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
            self.episodeTableView.alpha = 0
            self.episodeTableView.isHidden = true
            let model = self.seasonEpisodes[indexPath.section].episodeModelList[indexPath.row]
            self.selectEpisodeOutlet.setTitle("\(model.series) - \(model.season) X \(model.episode)", for: .normal)
            
        }
    }
}
