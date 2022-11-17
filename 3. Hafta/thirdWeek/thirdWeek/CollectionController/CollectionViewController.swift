//
//  CollectionViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var items: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        items.append(ItemModel(name: "Ömer", count: 4))
        items.append(ItemModel(name: "Faruk", count: 5))
        items.append(ItemModel(name: "Öztürk", count: 6))
        items.append(ItemModel(name: "Döner Dünya", count: 11))
        items.append(ItemModel(name: "Islak Islak   ", count: 11))
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.configure(model: items[indexPath.row])
        return cell
    }
    
    
    
}
