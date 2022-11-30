//
//  NoteViewController.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 30.11.2022.
//

import UIKit
import CoreData

final class NoteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataManager.shared.getNotes()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //Xib
        tableView.register(UINib(nibName: "CustomNoteCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
        //Auto
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let newNoteView = NewNoteView(frame: CGRect(origin: CGPointMake(view.center.x - 150, view.center.y - 150), size: CGSize(width: 300, height: 300)))
        newNoteView.alpha = 0
        UIView.animate(withDuration: 1.0) {
            newNoteView.alpha = 1
        }
        newNoteView.delegate = self
        view.addSubview(newNoteView)
    }
    
}

extension NoteViewController: NewNoteViewDelegate {
    func savePressed(input: String) {
        notes.append(CoreDataManager.shared.saveNote(text: input)!)
        self.tableView.reloadData()
    }
}

extension NoteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? CustomNoteCell else { return UITableViewCell()}
        cell.configureCell(model: notes[indexPath.row])
        return cell
    }
}
