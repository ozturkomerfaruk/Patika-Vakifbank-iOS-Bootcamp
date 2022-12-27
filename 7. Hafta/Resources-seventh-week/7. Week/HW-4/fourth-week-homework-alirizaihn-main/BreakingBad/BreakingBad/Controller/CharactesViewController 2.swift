//
//  CastTableViewController.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 25.11.2022.
//

import UIKit

final class CharactesViewController: BaseViewController {
//Karakterlerin CollectionView ile gösterildiği sayfanın VCsi.
    
    @IBOutlet private weak var castColectionView: UICollectionView! {
        didSet {
            castColectionView.dataSource = self
            castColectionView.delegate = self
            castColectionView.register(CharacterCollectionViewCell.nib(), forCellWithReuseIdentifier: "CharacterCollectionViewCell" )
        }
    }
    private var casts: [CastModel]? {
        didSet {
            castColectionView.reloadData()
        }
    }
//    DidLoad esnasında servis çağrısı yapılıyor.
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        Client.getCast() {
            [weak self] casts, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            if let error = error {
                self.showErrorAlert(message: error.localizedDescription) {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            if casts?.isEmpty ?? true {
                self.showErrorAlert(message: "No Cast") {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            self.casts = casts
            
        }
        
    }

}
extension CharactesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        casts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as? CharacterCollectionViewCell
        cell?.configure(with: (casts?[indexPath.row])!)
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController else { return }
        pushWithIdVC.character = casts?[indexPath.row]
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)
    }

}
//extension CharactesViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 276, height: 365)
//    }
//}
