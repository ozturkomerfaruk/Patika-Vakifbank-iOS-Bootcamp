//
//  CurrencyListViewController.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 23.11.2022.
//

import UIKit

final class CurrencyListViewController: BaseViewViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var results: [ResultModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        indicator.startAnimating()
        Client.getGetassets { [weak self] assets, error in
            guard let self = self else { return }
            self.results = assets
            self.indicator.stopAnimating()
        }
        
    }
    
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "AssetCustomCell", bundle: nil), forCellReuseIdentifier: "currencyCell")
    }
}

extension CurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? AssetCustomCell,
              let resultModel = results?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: resultModel)
        return cell
    }
    
}
