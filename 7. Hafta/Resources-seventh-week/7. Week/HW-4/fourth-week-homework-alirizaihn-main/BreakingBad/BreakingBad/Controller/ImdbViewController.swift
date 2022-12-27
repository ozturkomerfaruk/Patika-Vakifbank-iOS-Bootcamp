//
//  ImdbViewController.swift
//  BreakingBad
//
//  Created by Ali Rıza İLHAN on 25.11.2022.
//

import UIKit
import WebKit

final class ImdbViewController: BaseViewController {
    //   WebView Gösterilen ekranın VClü
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://www.imdb.com/title/tt0903747/"
        if let url = URL(string: urlString) {
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
            self.webView.addSubview(indicator)
            indicator.startAnimating()
            self.webView.navigationDelegate = self
        
        }
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
}
extension ImdbViewController : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webView.title
        self.indicator.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.indicator.stopAnimating()
    }
}

