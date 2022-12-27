//
//  CustomCollectionViewController.swift
//  ListComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class CustomCollectionViewController: UIViewController {

    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var items: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
        items.append(ItemModel(name: "Pencil", count: 1))
        items.append(ItemModel(name: "Eraser", count: 2))
        items.append(ItemModel(name: "Pen", count: 3))
        items.append(ItemModel(name: "Notbook", count: 4))
        items.append(ItemModel(name: "New Pencil", count: 1))
        items.append(ItemModel(name: "New Eraser", count: 2))
        items.append(ItemModel(name: "New Pen", count: 3))
        items.append(ItemModel(name: "New Notbook", count: 4))
    }
}

extension CustomCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.configure(model: items[indexPath.row])
        return cell
    }
}
