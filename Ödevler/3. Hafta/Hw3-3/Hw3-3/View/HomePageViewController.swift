//
//  HomePageViewController.swift
//  Hw3-3
//
//  Created by Ömer Faruk Öztürk on 20.11.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var quoteRandomOutlet: UIButton!
    
    @IBOutlet weak var quoteRandomLabel: UILabel!
    
    @IBOutlet weak var indicatorOutlet: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorOutlet.startAnimating()

        quoteRandomOutlet.layer.cornerRadius = quoteRandomOutlet.frame.height / 2
        Client.getQuoteRandom {
            response, error in
            guard (response) != nil else { return }
            self.title = response?.author
            self.quoteRandomLabel.text = response?.en
            self.indicatorOutlet.stopAnimating()
            self.indicatorOutlet.isHidden = true
        }
    }
    
    
    @IBAction func quoteRandom(_ sender: Any) {
        indicatorOutlet.startAnimating()
        self.indicatorOutlet.isHidden = false
        Client.getQuoteRandom {
            response, error in
            guard (response) != nil else { return }
            self.title = response?.author
            self.quoteRandomLabel.text = response?.en
            self.indicatorOutlet.stopAnimating()
            self.indicatorOutlet.isHidden = true
        }
    }
}
