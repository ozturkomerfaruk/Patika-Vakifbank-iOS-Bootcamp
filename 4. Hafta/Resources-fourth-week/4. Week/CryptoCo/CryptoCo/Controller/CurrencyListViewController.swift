//
//  ViewController.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import UIKit

final class CurrencyListViewController: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var assetsTableView: UITableView!
    
    //MARK: Properties
    private var assets: [AssetModel]? {
        didSet {
            assetsTableView.reloadData()
        }
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        indicator.startAnimating()
        Client.getAssets { [weak self] assets, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.assets = assets
        }
    }
    
    //MARK: Methods
    private func configureTableView() {
        assetsTableView.dataSource = self
        assetsTableView.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
    }
}

extension CurrencyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyTableViewCell, let model = assets?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
}

