//
//  MarketDetailViewController.swift
//  CrytoCo
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class MarketDetailViewController: BaseViewViewController {
    
    var selectedMarketModel: ResultMarketModel?
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var historyOrders: [ResultHistoryModel]? {
        didSet {
            detailTableView.reloadData()
        }
    }
    
    @IBOutlet private weak var detailTableView: UITableView! {
        didSet {
            detailTableView.dataSource = self
            detailTableView.delegate = self
            self.detailTableView.register(UINib(nibName: "CustomDetailCell", bundle: nil), forCellReuseIdentifier: "customDetailCell")
            detailTableView.estimatedRowHeight = UITableView.automaticDimension
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let market = selectedMarketModel else { return }
        titleLabel.text = market.marketName
        indicator.startAnimating()
        Client.getGetmarkethistory(market: market.marketName) { [weak self] history, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            if history?.isEmpty ?? true {
                self.showErrorAlert(message: "No History") {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            if let error = error {
                self.showErrorAlert(message: error.localizedDescription) {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
           
            self.historyOrders = history
        }
    }
    

        
}


extension MarketDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyOrders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = detailTableView.dequeueReusableCell(withIdentifier: "customDetailCell", for: indexPath) as? CustomDetailCell,
              let historyModel = historyOrders?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configureCell(model: historyModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
