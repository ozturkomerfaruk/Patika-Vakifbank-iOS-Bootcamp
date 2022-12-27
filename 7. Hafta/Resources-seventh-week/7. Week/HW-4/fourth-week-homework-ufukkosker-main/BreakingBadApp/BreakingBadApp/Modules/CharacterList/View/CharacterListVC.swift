//
//  CharacterListVC.swift
//  BreakingBadApp
//
//  Created by Ufuk on 21.11.2022.
//

import UIKit

class CharacterListVC: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: CharacterListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel?.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        let characterCellName = String(describing: CharacterCell.self)
        let characterCellNib = UINib(nibName: characterCellName, bundle: .main)
        collectionView.register(characterCellNib, forCellWithReuseIdentifier: characterCellName)
    }
}

extension CharacterListVC: CharacterListVCDelegate {
    func handle(output: CharacterListVCOutput) {
        switch output {
        case .fetchedCharacters:
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension CharacterListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let allCharacterCount = viewModel?.allCharaters.count
        else { return 0 }
        return allCharacterCount
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CharacterCell.self), for: indexPath) as? CharacterCell {
            guard let character = viewModel?.allCharaters[indexPath.row],
                  let allCharacterCount = viewModel?.allCharaters.count,
                  let offset = viewModel?.offsetCount
            else { return UICollectionViewCell() }
            cell.config(with: character)
            
            if indexPath.row == allCharacterCount - 1 && offset < 70 {
                viewModel?.fetchCharacterList()
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension CharacterListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCharacter = viewModel?.allCharaters[indexPath.row]
        else { return }
        let characterDetailViewModel = CharacterDetailVCViewModel(character: selectedCharacter)
        let characterDetailVC = CharacterDetailVC()
        characterDetailVC.viewModel = characterDetailViewModel
        UIApplication.topViewController()?.navigationController?.pushViewController(characterDetailVC, animated: true)
    }
}

extension CharacterListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 100)
    }
}
