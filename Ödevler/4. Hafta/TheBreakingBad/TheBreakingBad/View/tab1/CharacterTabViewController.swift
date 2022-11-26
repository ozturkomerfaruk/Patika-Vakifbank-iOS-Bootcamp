//
//  CharacterTabViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class CharacterTabViewController: BaseViewController {
    
    //MARK: Values
    @IBOutlet private weak var collectionView: UICollectionView!
    private var characters: [CharacterModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    private var filteredShow: [CharacterModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        
        //MARK: SearchController
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Search by name"
        navigationItem.searchController = search
        
        title = "Characters"
        
        configureCollectionView()
        
        //Client
        Client.getCharacters{ [weak self] characterList, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.characters = characterList
            self.filteredShow = characterList ?? []
        }
        
    }
    
    //MARK: Configure CollectionView
    private func configureCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "CharacterCustomCollectionCell", bundle: nil), forCellWithReuseIdentifier: "characterCustomCell")
    }
}

//MARK: SearchController with Endpoint
extension CharacterTabViewController: UISearchResultsUpdating {
    internal func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        let newString = text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        Client.getCharacterByName(name: newString) { model, error in
            self.characters = model
        }
        collectionView.reloadData()
    }
}

//MARK: CollectionView Delegate & DataSource
extension CharacterTabViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters?.count ?? 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCustomCell", for: indexPath) as? CharacterCustomCollectionCell,
              let model = characters?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailCharacterVC") as? DetailCharacterViewController,
              let model = characters?[indexPath.row]  else { return }
        detailVC.selectedModel = model
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: FlowLayout CollectionView
extension CharacterTabViewController: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return CGSize(width: 160, height: 100)
    }
}
