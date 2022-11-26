//
//  QuoteByAuthorViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

final class QuoteByAuthorViewController: BaseViewController {
    
    var authorName: String?
    @IBOutlet private weak var quotesTableView: UITableView!
    
    private var quotes: [QuoteByAuthorModel]? {
        didSet {
            quotesTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quotesTableView.dataSource = self
        indicator.startAnimating()
        //MARK: Client
        Client.getQuoteByAuthor(author: updateName(authorName!)) { [weak self] quotes, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            if quotes?.isEmpty ?? true {
                self.showErrorAlert(message: "No Quotes") {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            self.quotes = quotes ?? []
        }
        title = authorName
    }
    
    //Updating from space character to plus character for endpoint
    private func updateName(_ name: String) -> String {
        let newString = name.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        return newString
    }
}

//MARK: Quote DataSource
extension QuoteByAuthorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath)
        cell.textLabel?.text = quotes?[indexPath.row].quote ?? ""
        return cell
    }
}
