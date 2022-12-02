//
//  EpisodeNoteViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

final class EpisodeNoteViewController: UIViewController {
    
    
    @IBOutlet private weak var noteTableView: UITableView!
    var episodeNotes: [EpisodeNote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeNotes = CoreDataManager.shared.getNotes()
        configureTableView()
        configureFloatingButton()
    }
    
    private func configureTableView() {
        noteTableView.delegate = self
        noteTableView.dataSource = self
        noteTableView.register(UINib(nibName: "CustomNoteTableCell", bundle: nil), forCellReuseIdentifier: "customNoteTableCell")
        noteTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func configureFloatingButton() {
        let floatingButton = UIButton()
        floatingButton.setTitle("+", for: .normal)
        floatingButton.backgroundColor = .systemBlue
        floatingButton.titleLabel?.font = UIFont(name: "Helvetica", size: 40)
        
        floatingButton.layer.cornerRadius = 35
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        
        floatingButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        floatingButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        floatingButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true

        floatingButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        
        floatingButton.addTarget(self, action: #selector(floatingPressed), for: .touchUpInside)
    }
    
    @objc func floatingPressed() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newNoteVC") as? NewEpisodeNoteViewController else { return }
        // Delegate Pattern
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension EpisodeNoteViewController: NewNoteViewDelegate {
    func saveCoreData(tvSeries: String, noteText: String, image: UIImage, episode: String) {
        episodeNotes.append(CoreDataManager.shared.saveNote(tvSeries: tvSeries, noteText: noteText, image: image, episode: episode)!)
        self.noteTableView.reloadData()
    }
}

extension EpisodeNoteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customNoteTableCell", for: indexPath) as? CustomNoteTableCell else { return UITableViewCell()}
        cell.configureCell(model: episodeNotes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(episodeNotes[indexPath.row])
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "newNoteVC") as? NewEpisodeNoteViewController else { return }
        vc.modelConstructor = episodeNotes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let model = episodeNotes[indexPath.row]
        episodeNotes.remove(at: indexPath.row)
        noteTableView.deleteRows(at: [indexPath], with: .fade)
        CoreDataManager.shared.deleteNote(model: model)
    }
}
