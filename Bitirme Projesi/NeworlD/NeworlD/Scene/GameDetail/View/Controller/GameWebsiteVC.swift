//
//  GameWebsiteVC.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 10.12.2022.
//

import UIKit
import WebKit

final class GameWebsiteVC: UIViewController, WKNavigationDelegate {
    
    var  gameWebsiteURLString: String?
    
    @IBOutlet private weak var gameWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        gameWebView.navigationDelegate = self
        gameWebView.backgroundColor = .clear
        gameWebView.tintColor = .purple
        
        let url = URL(string: gameWebsiteURLString!)
        let request = URLRequest(url: url ?? URL(string: Constants.OPPSImageURL)!)
        gameWebView.load(request)
        gameWebView.allowsBackForwardNavigationGestures = true
    }
    
}
