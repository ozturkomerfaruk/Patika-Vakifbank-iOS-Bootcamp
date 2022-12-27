//
//  MarketDetailViewController.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit

class MarketDetailViewController: BaseViewController {
    
    @IBOutlet weak var historyTableView: UITableView! {
        didSet {
            historyTableView.dataSource = self
            historyTableView.delegate = self
            historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
            historyTableView.estimatedRowHeight = UITableView.automaticDimension
        }
    }
    @IBOutlet weak var marketTitleLabel: UILabel!
    
    var selectedMarket: MarketModel?
    private var historyOrders: [HistoryModel]? {
        didSet {
            historyTableView.reloadData()
        }
    }
    
    //requestte marketname marketasset değişimi yap ve göster.
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let market = selectedMarket else { return }
        marketTitleLabel.text = market.marketName
        indicator.startAnimating()
        Client.getMarketHistory(market: market.marketName) { [weak self] historyOrders, error in
            guard let self = self else { return }
            if let error = error {
                self.showErrorAlert(message: error.localizedDescription) {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            if historyOrders?.isEmpty ?? true {
                self.showErrorAlert(message: "No History") {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            self.indicator.stopAnimating()
            self.historyOrders = historyOrders
        }
    }
}

extension MarketDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyOrders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryTableViewCell, let model = historyOrders?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
