//
//  ViewController.swift
//  ThirdWeekThirdHomework
//
//
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var quotesLabel: UILabel!
    
    private var randomQuotes: GetRandomQueotesModel? {
           didSet {
               if let quotes = randomQuotes?.en {
                   quotesLabel.text = String(quotes)
               }
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareQuote()
    }
    
    @IBAction private func getRandomQuotesPressed(_ sender: Any) {
        prepareQuote()
    }
    
    private func prepareQuote() {
        Client.getRandomQuotes {[weak self] randomQuotes, error in
            guard let self = self else {return}
            guard let randomQuotes = randomQuotes else { return }
            self.randomQuotes = randomQuotes
        }
    }
}
