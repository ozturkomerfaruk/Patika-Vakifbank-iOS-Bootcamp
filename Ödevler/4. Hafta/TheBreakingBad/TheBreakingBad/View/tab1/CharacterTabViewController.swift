//
//  CharacterTabViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class CharacterTabViewController: BaseViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var characters: [CharacterModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        configureCollectionView()
        
        Client.getCharacters{ [weak self] characters, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.characters = characters
            self.indicator.stopAnimating()
        }
    }
    
    private func configureCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "CharacterCustomCollectionCell", bundle: nil), forCellWithReuseIdentifier: "characterCustomCell")
    }
}

extension CharacterTabViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCustomCell", for: indexPath) as? CharacterCustomCollectionCell,
              let model = characters?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailCharacterVC") as? DetailCharacterViewController,
              let model = characters?[indexPath.row]  else { return }
        detailVC.selectedModel = model
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CharacterTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return CGSize(width: 160, height: 100)
    }
}
