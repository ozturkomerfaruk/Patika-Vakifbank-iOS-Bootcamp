//
//  EpisodeDetailVew.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 23.11.2022.
//

import UIKit

protocol subviewRemoveDelegate: AnyObject {
    func removeSubview()
}

class EpisodeDetailVew: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var actorsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    weak var closeButtonDelegate: subviewRemoveDelegate?
    var characters = [CharacterModel]()
    var characterNames: [String]? {
        didSet {
            actorsCollectionView.reloadData()
            getCharactersInEpisode()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func customInit() {
        let nib = UINib(nibName: "EpisodeDetailView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
            view.backgroundColor = .black
            view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        }
        configureComponents()
        actorsCollectionView.delegate = self
        actorsCollectionView.dataSource = self
        actorsCollectionView.register(UINib(nibName: "CharacterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "characterCollectionCell")
    }
    
    // configures components
    func configureComponents() {
        containerView.layer.cornerRadius        = 15
        containerView.layer.shadowColor         = UIColor.black.cgColor
        containerView.layer.shadowOffset        = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius        = 15
        containerView.layer.shadowOpacity       = 0.3
        containerView.layer.masksToBounds       = false
        
        actorsCollectionView.layer.cornerRadius = 15
        actorsCollectionView.backgroundColor    = .systemGray4
    }
    
    // gets characters in selected episodes from API
    func getCharactersInEpisode() {
        var nameToSearch = ""
        let group = DispatchGroup()
        characterNames?.forEach{ name in
            let controlledName = NameControl.nameControl(name: name)
            nameToSearch = controlledName.replacingOccurrences(of: " ", with: "+")
            group.enter()
            activityIndicator.startAnimating()
            NetworkManager.getCharacters(nameToSearch: nameToSearch) { characterArray, error in
                defer { group.leave()}
                guard let characterArray = characterArray else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    return
                }
                guard let character = characterArray.first else { return }
                self.characters.append(character)
            }
        }
        group.notify(queue: .main) {
            self.activityIndicator.stopAnimating()
            self.actorsCollectionView.reloadData()
        }
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        closeButtonDelegate?.removeSubview()
    }
}


extension EpisodeDetailVew: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = actorsCollectionView.dequeueReusableCell(withReuseIdentifier: "characterCollectionCell", for: indexPath) as? CharacterCollectionCell
        guard let cell = cell else { return UICollectionViewCell() }
        cell.character = characters[indexPath.row]
        return cell
    }
    
    // for create 2 cells in a row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width                       = actorsCollectionView.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding*2) - minimumItemSpacing
        let itemWidth                   = availableWidth / 2
        return .init(width: itemWidth, height: itemWidth + 40)
    }
    
    // for determine section inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 10, right: 10)
    }
}

