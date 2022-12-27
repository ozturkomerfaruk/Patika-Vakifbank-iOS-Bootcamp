//
//  CharacterQuotesViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 22.11.2022.
//

import UIKit

class CharacterQuotesViewController: UIViewController {

    @IBOutlet weak var quotesTableView: UITableView!
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var quotesCard: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var character: CharacterModel?
    var quotes: [QuoteModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quotesTableView.delegate = self
        quotesTableView.dataSource = self
        
        quotesTableView.register(UINib(nibName: "QuotesTableViewCell", bundle: nil), forCellReuseIdentifier: "quoteCell")
        getQuotes()
        congigureComponents()
    }

    // gets quotes of selected character. If there is not, shows alert
    func getQuotes() {
        guard let character = character else { return }
        let fullName = character.name
        let nameToSearch = fullName.replacingOccurrences(of: " ", with: "+")
        
        activityIndicator.startAnimating()
        NetworkManager.getQuotesForCharacter(nameToSearch: nameToSearch) { quotes, error in
            self.activityIndicator.stopAnimating()
            guard let quotes = quotes else {
                if let error = error {
                    self.alert(title: "Alert", message: error.localizedDescription)
                }
                return
            }
            if quotes.isEmpty {
                self.alert(title: "Alert", message: "There is no quote to show.")
            }
            self.quotes = quotes
            DispatchQueue.main.async {
                self.quotesTableView.reloadData()
            }
        }
    }
    
    // configures components
    func congigureComponents() {
        nameTextField.text = character?.name
        
        quotesTableView.backgroundColor = .systemGray6
        
        quotesCard.layer.cornerRadius = 15
        quotesCard.layer.shadowColor = UIColor.black.cgColor
        quotesCard.layer.shadowOffset = CGSize(width: 0, height: 0)
        quotesCard.layer.shadowRadius = 15
        quotesCard.layer.shadowOpacity = 0.3
        quotesCard.layer.masksToBounds = false
    }
}


extension CharacterQuotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = quotesTableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as? QuotesTableViewCell
        cell?.quoteTextField.text = quotes?[indexPath.row].quote
        return cell ?? UITableViewCell()
    }
}
