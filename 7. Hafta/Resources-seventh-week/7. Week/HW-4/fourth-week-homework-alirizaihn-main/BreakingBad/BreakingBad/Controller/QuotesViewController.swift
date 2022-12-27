//
//  QuotesViewController.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 27.11.2022.
//

import UIKit

final class QuotesViewController: BaseViewController {
//    Karakterlerin Sözlerinin gösterildiği ekranın VClu
    var character: CastModel?
    var quotesArray: [QuoteModel]? {
        didSet {
            quotesTableView.reloadData()
        }
    }
    @IBOutlet weak var quotesTableView: UITableView! {
        didSet {
            quotesTableView.delegate = self
            quotesTableView.dataSource = self
        }
    }
    //    DidLoad esnasında servis çağrısı yapılıyor.
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = character{
            indicator.startAnimating()
            Client.getQuotes(castName: character.name.replacingOccurrences(of: " ", with: "+")) {[ weak self ] quotes, error in
                self?.indicator.stopAnimating()
                guard let self = self else { return }
                if let error = error {
                    self.showErrorAlert(message: error.localizedDescription) {
                        self.navigationController?.popViewController(animated: true)
                    }
                    return
                }
                if quotes?.isEmpty ?? true {
                    self.showErrorAlert(message: "No Cast") {
                        self.navigationController?.popViewController(animated: true)
                    }
                    return
                }
                self.quotesArray = quotes
            }
        }
        
    }
}
extension QuotesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = quotesArray?[indexPath.row].quote
        cell.backgroundColor = .clear
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
}
