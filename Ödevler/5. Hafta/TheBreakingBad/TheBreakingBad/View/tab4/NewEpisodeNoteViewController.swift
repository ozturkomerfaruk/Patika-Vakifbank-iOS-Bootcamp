//
//  NewEpisodeNoteViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 1.12.2022.
//

import UIKit

final class NewEpisodeNoteViewController: BaseViewController {
    
    @IBOutlet private weak var newOrUpdateTextLabel: UILabel!
    @IBOutlet private weak var chooseTvSeriesOutlet: UIButton!
    @IBOutlet private var tvSeriesCollection: [UIButton]!
    @IBOutlet private weak var selectEpisodeOutlet: UIButton!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var getPhotoOutlet: UIButton!
    @IBOutlet private weak var typeNoteTextView: UITextView!
    @IBOutlet private weak var saveNoteOutlet: UIButton!
    
    
    weak var delegate: NewNoteViewDelegate?
    var modelConstructor: EpisodeNote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        if modelConstructor != nil {
            configureTools()
            saveNoteOutlet.titleLabel?.text = "Update Note"
            newOrUpdateTextLabel.text = "Update Episode Note"
        }
    }
    
    func configureTools() {
        
        chooseTvSeriesOutlet.titleLabel!.text = modelConstructor?.tvSeries
        selectEpisodeOutlet.titleLabel!.text = modelConstructor?.episode
        typeNoteTextView.text = modelConstructor?.noteText
        
        if modelConstructor?.image != nil {
            imageView.image = UIImage(data: (modelConstructor?.image!)!)
            imageView.isHidden = false
        }
    }
    
    private func configure() {
        
        saveNoteOutlet.titleLabel?.font.withSize(30)
        saveNoteOutlet.layer.cornerRadius = saveNoteOutlet.frame.height / 2
        chooseTvSeriesOutlet.layer.cornerRadius = chooseTvSeriesOutlet.frame.height / 2
        getPhotoOutlet.layer.cornerRadius = getPhotoOutlet.frame.height / 2
        tvSeriesCollection.forEach {
            btn in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden = true
            btn.alpha = 0
        }
        selectEpisodeOutlet.layer.cornerRadius = selectEpisodeOutlet.frame.height / 2
        imageView.isHidden = true
    }
    
    @IBAction func DismissPresent(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tvSeriesCollectionAction(_ sender: UIButton) {
        if let btn = sender.titleLabel?.text {
            chooseTvSeriesOutlet.setTitle(btn, for: .normal)
            tvSeriesCollection.forEach {
                btn in
                UIView.animate(withDuration: 0.8) {
                    btn.isHidden = true
                    btn.alpha = 0
                    if self.chooseTvSeriesOutlet.titleLabel?.text != "Choose Tv-Series" {
                        self.selectEpisodeOutlet.setTitle("Select Episode", for: .normal)
                    }
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
    
    
    
    
    @IBAction func selectEpisodeAction(_ sender: Any) {
        
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .systemGray
        }
        
        let myView = SelectEpisodeView(frame: CGRect(origin: CGPointMake(view.center.x - 175, view.center.y - 250), size: CGSize(width: 350, height: 500)))
        myView.alpha = 0
        UIView.animate(withDuration: 1.0) {
            myView.alpha = 1
        }
        myView.delegate = self
        view.addSubview(myView)
    }
    
    @IBAction func takeAPhoto(_ sender: Any) {
        showPhotoAlert()
    }
    
    private func showPhotoAlert() {
        
        
        let beganSeries = chooseTvSeriesOutlet.titleLabel?.text
        let beganEpisode = selectEpisodeOutlet.titleLabel?.text
        
        print("Başlangıçta: " + beganSeries! + " " + beganEpisode!)
        
        let alert = UIAlertController(title: "Take Photo From", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.getPhoto(type: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        if imageView.image != nil {
            alert.addAction(UIAlertAction(title: "Delete Photo", style: .default, handler: { action in
                self.imageView.image = nil
                self.imageView.isHidden = true
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        chooseTvSeriesOutlet.titleLabel?.text = beganSeries
        selectEpisodeOutlet.titleLabel?.text = beganEpisode
        chooseTvSeriesOutlet.setTitle(beganSeries, for: .normal)
        selectEpisodeOutlet.setTitle(beganEpisode, for: .normal)
        print(beganSeries! + " " + beganEpisode!)
    }
    
    private func getPhoto(type: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        self.imageView.isHidden = false
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        let tvSeriesCD = chooseTvSeriesOutlet.titleLabel!.text ?? ""
        let episodeCD = selectEpisodeOutlet.titleLabel!.text ?? ""
        let noteCD = typeNoteTextView.text ?? ""
        let imageCD = imageView.image ?? UIImage()
        
        if tvSeriesCD != "Choose Tv-Series" && episodeCD != "Select Episode" && !noteCD.isEmpty {
            if modelConstructor == nil {
                delegate?.saveCoreData(tvSeries: tvSeriesCD, noteText: noteCD, image: imageCD, episode: episodeCD)
                self.navigationController?.popViewController(animated: true)
            } else {
                CoreDataManager.shared.updateNote(tvSeries: tvSeriesCD, noteText: noteCD, image: imageCD, episode: episodeCD, model: modelConstructor!)
                delegate?.updateCoreData()
                self.navigationController?.popViewController(animated: true)
            }
            dismiss(animated: true)
            let info = """
            TvSeries: \(tvSeriesCD)
            
            Season & Episode: \(episodeCD)
            
            Note: \(noteCD)
            """
            showSuccessAlert(message: info) {
                return
            }
        } else {
            showErrorAlert(message: "Fill Everything") {
                return
            }
        }
        
        
    }
    
}

extension NewEpisodeNoteViewController: EpisodeViewDelegate {
    func closeView() {
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .white
        }
    }
    
    func getModelTableView(episodeModel: EpisodeModel) {
        print("asdasd")
        self.chooseTvSeriesOutlet.setTitle(episodeModel.series, for: .normal)
        self.selectEpisodeOutlet.setTitle("Episode: \(episodeModel.season) X \(episodeModel.episode)", for: .normal)
        
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = .white
        }
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


