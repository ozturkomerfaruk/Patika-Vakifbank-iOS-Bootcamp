//
//  QuotesListVC.swift
//  BreakingBadApp
//
//  Created by Ufuk on 25.11.2022.
//

import UIKit

class QuotesListVC: UIViewController {
    
    @IBOutlet private weak var quotesTableView: UITableView!
    var viewModel: QuotesListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        quotesTableView.dataSource = self
        registerCell()
        viewModel?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func registerCell() {
        let quoteCellName = String(describing: QuoteCell.self)
        let quoteCellNib = UINib(nibName: quoteCellName, bundle: .main)
        quotesTableView.register(quoteCellNib, forCellReuseIdentifier: quoteCellName)
    }
}

extension QuotesListVC: QuotesListVCDelegate {
    func handle(output: QuotesListVCOutput) {
        switch output {
        case .fetchedAllQuotes:
            DispatchQueue.main.async {
                self.quotesTableView.reloadData()
            }
        }
    }
}

extension QuotesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let allQuotesCount = viewModel?.allQuotes.count
        else { return 0 }
        return allQuotesCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let quote = viewModel?.allQuotes[indexPath.row].quote
        else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QuoteCell.self), for: indexPath) as? QuoteCell {
            cell.config(with: quote)
            return cell
        }
        return UITableViewCell()
    }
}
