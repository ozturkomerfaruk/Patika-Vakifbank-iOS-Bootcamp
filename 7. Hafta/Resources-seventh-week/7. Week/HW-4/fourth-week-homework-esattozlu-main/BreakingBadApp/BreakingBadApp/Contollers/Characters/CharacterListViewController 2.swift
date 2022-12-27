//
//  CharacterListViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 22.11.2022.
//

import UIKit

class CharacterListViewController: UIViewController {

    @IBOutlet weak var characterCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var characters = [CharacterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterCollectionView.delegate    = self
        characterCollectionView.dataSource  = self
        
        characterCollectionView.register(UINib(nibName: "CharacterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "characterCollectionCell")
        getCharacters()
    }
    
    // gets all characters
    func getCharacters() {
        activityIndicator.startAnimating()
        NetworkManager.getCharacters { characters, error in
            self.activityIndicator.stopAnimating()
            if let characters = characters {
                self.characters = characters
            } else {
                if let error = error {
                    self.alert(title: "Alert", message: error.localizedDescription)
                }
            }
            DispatchQueue.main.async {
                self.characterCollectionView.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = sender as? Int else { return }
        let characterDetailVC = segue.destination as? CharacterDetailsViewController
        characterDetailVC?.character = characters[index]
    }
}


extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = characterCollectionView.dequeueReusableCell(withReuseIdentifier: "characterCollectionCell", for: indexPath) as? CharacterCollectionCell
        guard let cell = cell else { return UICollectionViewCell() }
        cell.character = characters[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCharacterDetails", sender: indexPath.item)
    }
    
}


extension CharacterListViewController: UICollectionViewDelegateFlowLayout {
    
    // creates 2 cells in a row in CollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding*2) - minimumItemSpacing
        let itemWidth                   = availableWidth / 2
        return .init(width: itemWidth, height: itemWidth + 40)
    }
    
    // determines section inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 10, right: 10)
    }
}
