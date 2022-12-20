//
//  GameNotesVC.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 11.12.2022.
//

import UIKit

final class GameNotesVC: BaseVC {
    
    private var viewModel = GameNotesViewModel()
    
    @IBOutlet private weak var addNoteOutlet: UIButton!
    @IBOutlet private weak var notesTableView: UITableView!
    @IBOutlet private weak var titleName: UILabel!
    
    private var lottieView = LottieView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        viewModel.delegate = self
        viewModel.fetchGameNotes()
        
        addNoteOutlet.layer.cornerRadius = addNoteOutlet.frame.height / 2
        notesTableView.backgroundColor = .clear
        
        titleName.text = viewModel.isArrayEmpty() ? "anyNotes".localized() : "notes".localized()
    }

    @IBAction func addNoteAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addNoteVC") as? AddNoteVC else { return }
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension GameNotesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getGameNotesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gameNotesCustomCell", for: indexPath) as? GameNotesCustomCell,
              let titleString = viewModel.getGameNotes(index: indexPath.row).title else { return UITableViewCell() }
        cell.configure(titleString: titleString)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        showAlertWithCancel(title: "warning".localized(), message: "deletedNote".localized()) { buttonIndex in
            if buttonIndex == 0 {
                self.viewModel.deleteGameNote(index: indexPath.row)
                return tableView.deleteRows(at: [], with: .fade)
            } else {
                return
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addNoteVC") as? AddNoteVC else { return }
        vc.delegate = self
        vc.gameNote = viewModel.getGameNotes(index: indexPath.row)
        vc.gameId = Int(viewModel.getGameNotes(index: indexPath.row).gameId)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension GameNotesVC: AddNoteVCDelegate {
    func saveCoreData(title: String, body: String, gameId: Int) {
        showAlert(title: "successful".localized(), message: "\(title) \n " + "notedSaved".localized()) { [weak self] in
            guard let self = self else { return }
            self.viewModel.appendGameNote(title: title, body: body, gameId: gameId)
        }
    }
    
    func updateCoreData(title: String, body: String, gameId: Int, model: GameNoteEntity) {
        showAlert(title: "successful".localized(), message: "\(title) \n" + "notedUpdated".localized()) { [weak self] in
            guard let self = self else { return }
            self.viewModel.updateGameNote(title: title, body: body, gameId: gameId, model: model)
        }
        
    }
}

extension GameNotesVC: GameNotesViewModelDelegate {
    func notesLoaded() {
        notesTableView.reloadData()
        titleName.text = viewModel.isArrayEmpty() ? "anyNotes".localized() : "notes".localized()
        if viewModel.isArrayEmpty() {
            titleName.textAlignment = viewModel.isArrayEmpty() ? .center : .left
        }
    }
    
    func notesFailed(error: Error) {
        showAlert(title: "error".localized(), message: "\(error)", completion: { })
    }
    
    func preFetch() {
        lottieView = LottieView(frame: CGRect(origin: CGPointMake(0, 200), size: CGSize(width: self.view.frame.width, height: 400)))
        lottieView.backgroundColor = .black
        LottieManager.shared.playLottie(view: lottieView, lottieName: LottieNames.macintosh.rawValue)
        self.view.addSubview(lottieView)
    }
    
    func postFetch() {
        LottieManager.shared.stopLottie()
        self.lottieView.isHidden = true
    }
}
