//
//  IMDBPageViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 25.11.2022.
//

import UIKit
import WebKit

final class IMDBPageViewController: BaseViewController, WKNavigationDelegate {
    
    private var webView: WKWebView!
    private var progressView: UIProgressView!
    private var dictWebSiteUrl = [
        "BreakingBad": URL(string: "https://www.imdb.com/title/tt0903747/")!,
        "BetterCallSaul": URL(string: "https://www.imdb.com/title/tt3032476/?ref_=nv_sr_srsg_0")!,
        "ozturkomerfaruk": URL(string: "https://www.ozturkomerfaruk.com")!
    ] as [String : Any]
    private var isBreakingBad = true
    
    
    ///indicator does not appear in view. I do not know why.
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        webViewLoading()
        //My blog page :)
        authorSignature()
    }
    
    //For WebView
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    private func webViewLoading() {
        indicator.startAnimating()
        let url = dictWebSiteUrl["BreakingBad"]
        webView.load(URLRequest(url: url as! URL))
        webView.allowsBackForwardNavigationGestures = true
        //Navigation Item
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Better Call Saul", style: .plain, target: self, action: #selector(changeWebViewUrl))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.customView?.backgroundColor = .systemBlue
        indicator.stopAnimating()
    }
    
    //My blog page ^^
    private func authorSignature() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "My Blog Page", style: .plain, target: self, action: #selector(myBlogPage))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    //Switching between Breaking Bad and Better Call Saul with bar button item in Webview
    @objc private func changeWebViewUrl(){
        if isBreakingBad {
            indicator.startAnimating()
            webView.load(URLRequest(url: dictWebSiteUrl["BetterCallSaul"] as! URL))
            isBreakingBad = false
            navigationItem.rightBarButtonItem?.title = "Breaking Bad"
            indicator.stopAnimating()
            navigationItem.leftBarButtonItem?.tintColor = .white
            navigationItem.rightBarButtonItem?.tintColor = .white
        } else {
            indicator.startAnimating()
            webView.load(URLRequest(url: dictWebSiteUrl["BreakingBad"] as! URL))
            isBreakingBad = true
            navigationItem.rightBarButtonItem?.title = "Better Call Saul"
            indicator.stopAnimating()
            navigationItem.leftBarButtonItem?.tintColor = .white
            navigationItem.rightBarButtonItem?.tintColor = .white
        }
    }
    
    //My Blog Page ^
    @objc private func myBlogPage(){
        let url = dictWebSiteUrl["ozturkomerfaruk"]
        webView.load(URLRequest(url: url as! URL))
        webView.allowsBackForwardNavigationGestures = true
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
}
