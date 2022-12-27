//
//  EpisodeListViewController.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 26.11.2022.
//

import UIKit

final class EpisodeListViewController: BaseViewController {
    //    Bölümlerin Listelendiği ekranın Vcsi.
    @IBOutlet private weak var episodeTableView: UITableView! {
        didSet {
            episodeTableView.dataSource = self
            episodeTableView.delegate = self
            //            historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
            episodeTableView.estimatedRowHeight = UITableView.automaticDimension
        }
    }
    var seasons: [SeasonModel]? {
        didSet {
            print("vaklsjdasda\(String(describing: seasons?[3]))")
            episodeTableView.reloadData()
        }
    }
    var episodes: [EpisodeModel]? {
        didSet {
            
            seasons = episodes?.reduce(into: [SeasonModel](), { s1, s2 in

                if ((s1.isEmpty)) {
                   s1.append(SeasonModel(name: s2.season, episodes: [s2]))
                } else {
                    if let index =  s1.firstIndex(where: { $0.name == s2.season.components(separatedBy: " ").joined()}) {
                        s1[index].episodes.append(s2)
                    } else {
                        s1.append(SeasonModel(name: s2.season, episodes: [s2]))
                    }
                }
               
            })
        }
    }
   
    //    DidLoad esnasında servis çağrısı yapılıyor.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.startAnimating()
        Client.getEpisode { [weak self] episodes, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            if let error = error {
                self.showErrorAlert(message: error.localizedDescription) {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            if episodes?.isEmpty ?? true {
                self.showErrorAlert(message: "No Episode") {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            self.episodes = episodes
        }
    }
    func openOverLayer(_ characters: [String]) {
        let overLayerView = OverLayerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        overLayerView.alpha = 0
        UIView.animate(withDuration: 0.5) {
            overLayerView.alpha = 1
        }
        overLayerView.delegate = self
        overLayerView.characters = characters
        view.addSubview(overLayerView)
    }
    
}
extension EpisodeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seasons?[section].episodes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = seasons?[indexPath.section].episodes[indexPath.row].title
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        seasons?.count ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openOverLayer(seasons?[indexPath.section].episodes[indexPath.row].characters ?? [String]())
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .systemYellow
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.text = "Season: " + (seasons?[section].name ?? "")
        
        view.addSubview(lbl)
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
extension EpisodeListViewController : CloseViewDelegate {
    func closeButtonPressed() {
        print("Kapatıldı")
    }
    
}
