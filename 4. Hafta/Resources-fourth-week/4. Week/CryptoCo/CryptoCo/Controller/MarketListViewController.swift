//
//  MarketListViewController.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import UIKit

final class MarketListViewController: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var marketsTableView: UITableView! {
        didSet {
            marketsTableView.dataSource = self
            marketsTableView.delegate = self
            marketsTableView.register(UINib(nibName: "MarketTableViewCell", bundle: nil), forCellReuseIdentifier: "MarketCell")
        }
    }
    
    //MARK: Properties
    private var markets: [MarketModel]? {
        didSet {
            marketsTableView.reloadData()
        }
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        Client.getMarkets { [weak self] markets, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.markets = markets
        }
    }
}

extension MarketListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        markets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as? MarketTableViewCell, let model = markets?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "MarketDetailViewController") as? MarketDetailViewController, let selectedMarket = markets?[indexPath.row] else { return }
        detailVC.selectedMarket = selectedMarket
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
