//
//  IMDBViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Esat Tozlu on 22.11.2022.
//

import UIKit
import WebKit

class IMDBViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        loadWebView()
    }
    
    // loads IMBD page of Breaking Bad
    func loadWebView() {
        let urlString = "https://www.imdb.com/title/tt0903747/?ref_=ttep_ep_tt"
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
            activityIndicator.startAnimating()
        }
        let homepageButton = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .done, target: self, action: #selector(loadHomePage))
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        navigationItem.rightBarButtonItem = homepageButton
        navigationItem.leftBarButtonItem = refreshButton
    }
    
    // to turn back to homepage
    @objc func loadHomePage() {
        let urlString = "https://www.imdb.com/title/tt0903747/?ref_=ttep_ep_tt"
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}

// to show and hide acitivity indicator when page is loaded or failed
extension IMDBViewController: WKNavigationDelegate {
    
       func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           activityIndicator.stopAnimating()
       }

       func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
           activityIndicator.stopAnimating()
       }
}
