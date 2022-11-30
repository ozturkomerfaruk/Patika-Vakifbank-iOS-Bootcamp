//
//  MarketListViewController.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

class MarketListViewController: BaseViewViewController {
    
    @IBOutlet weak var marketTableView: UITableView!
    
    private var markets: [ResultMarketModel]? {
        didSet {
            marketTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        Client.getGetMarkets { [weak self] markets, error in
            guard let self = self else { return }
            self.markets = markets
            self.indicator.stopAnimating()
        }
    }
    
    private func configureTableView() {
        self.marketTableView.dataSource = self
        self.marketTableView.delegate = self
        self.marketTableView.register(UINib(nibName: "MarketCustomCell", bundle: nil), forCellReuseIdentifier: "marketCustomCell")
    }
    
    
}


extension MarketListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        markets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = marketTableView.dequeueReusableCell(withIdentifier: "marketCustomCell", for: indexPath) as? MarketCustomCell,
              let marketModel = markets?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: marketModel)
        return cell
    }
}

extension MarketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "marketDetailVC") as? MarketDetailViewController,
              let selectedMarketModel = markets?[indexPath.row] else { return }
        detailVC.selectedMarketModel = selectedMarketModel
        navigationController?.pushViewController(detailVC, animated: true)
    } 
}
