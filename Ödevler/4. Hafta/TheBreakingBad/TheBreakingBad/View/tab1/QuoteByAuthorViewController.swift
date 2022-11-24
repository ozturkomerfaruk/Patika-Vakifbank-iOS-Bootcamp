//
//  QuoteByAuthorViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit

class QuoteByAuthorViewController: BaseViewController {
    
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
    
    private func updateName(_ name: String) -> String {
        switch name {
        case "Walter White":
            return "Walter+White"
        case "Skyler White":
            return "Skyler+White"
        case "Saul Goodman":
            return "Saul+Goodman"
        case "Jesse Pinkman":
            return "Jesse+Pinkman"
        case "Hank Schrader":
            return "Hank+Schrader"
        case "Mike Ehrmantraut":
            return "Mike+Ehrmantraut"
        case "Gus Fring":
            return "Gus+Fring"
        case "Hector Salamanca":
            return "Hector+Salamanca"
        case "Jimmy McGill":
            return "Jimmy+McGill"
        case "Chuck McGill":
            return "Chuck+McGill"
        case "Kim Wexler":
            return "Kim+Wexler"
        default:
            return ""
        }
        
        
    }
}

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
