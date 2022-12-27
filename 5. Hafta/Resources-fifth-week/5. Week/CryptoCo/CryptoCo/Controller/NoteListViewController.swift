//
//  NoteListViewController.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 26.11.2022.
//

import UIKit

final class NoteListViewController: UIViewController {

    @IBOutlet weak var noteListTableView: UITableView!
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataManager.shared.getNotes()
        configureTableView()
    }
    
    private func configureTableView() {
        noteListTableView.delegate = self
        noteListTableView.dataSource = self
        noteListTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
        noteListTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    @IBAction func addNoteButtonPressed(_ sender: Any) {
        let newNoteView = NewNoteView(frame: CGRect(origin: CGPointMake(view.center.x - 100, view.center.y - 100), size: CGSize(width: 200, height: 200)))
        newNoteView.alpha = 0
        UIView.animate(withDuration: 2.0) {
            newNoteView.alpha = 1
        }
        newNoteView.delegate = self
        view.addSubview(newNoteView)
    }
}

extension NoteListViewController: NewNoteViewDelegate {
    func savePressed(input: String) {
        notes.append(CoreDataManager.shared.saveNote(text: input)!)
        noteListTableView.reloadData()
    }
}

extension NoteListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(model: notes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = notes[indexPath.row]
            CoreDataManager.shared.deleteNote(note: note)
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
