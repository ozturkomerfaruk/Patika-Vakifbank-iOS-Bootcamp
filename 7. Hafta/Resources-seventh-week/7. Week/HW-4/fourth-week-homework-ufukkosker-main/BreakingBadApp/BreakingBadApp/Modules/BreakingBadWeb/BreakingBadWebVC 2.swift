//
//  BreakingBadWebVC.swift
//  BreakingBadApp
//
//  Created by Ufuk on 27.11.2022.
//

import UIKit
import WebKit

class BreakingBadWebVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        let url = URL(string: "https://www.imdb.com/title/tt0903747/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
