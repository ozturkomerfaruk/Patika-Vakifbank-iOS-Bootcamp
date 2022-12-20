//
//  BaseVC.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 14.12.2022.
//

import UIKit
import SwiftAlertView
import MaterialActivityIndicator

class BaseVC: UIViewController {
    
    let indicator = MaterialActivityIndicatorView()
    private var lottieView = LottieView()

    override func viewDidLoad() {
        super.viewDidLoad()

        if Constants.API_KEY == "##API_KEY##" {
            showAlert(title: "createAPI".localized(), message: "APIWarning".localized(), completion: { exit(0) })
        }
        
        
        configureBaseVC()
        setupActivityIndicatorView()
    }
    
     private func configureBaseVC() {
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor.black
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func showAlert(title: String, message: String, completion: @escaping () -> Void) {
        SwiftAlertView.show(title: title, message: message, buttonTitles: ["ok".localized()]).onButtonClicked {
            _, _ in
            completion()
        }
    }
    
    func showAlertWithCancel(title: String, message: String, completion: @escaping ( _ buttonIndex: Int) -> Void) {
        SwiftAlertView.show(title: title, message: message, buttonTitles: ["ok".localized(), "cancel".localized()]).onButtonClicked {
            _, buttonIndex in
            completion(buttonIndex)
        }
    }
    
    private func setupActivityIndicatorView() {
        view.addSubview(indicator)
        indicator.color = .white
        constraintActivityIndicatorView()
    }
    
    private func constraintActivityIndicatorView() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func loadingLottieView(name: String) {
        lottieView = LottieView(frame: CGRect(origin: CGPointMake(self.view.center.x - 150, self.view.center.y - 150), size: CGSize(width: 300, height: 300)))
        LottieManager.shared.playLottie(view: lottieView, lottieName: name)
        self.view.addSubview(lottieView)
    }
    
    func stopLottie() {
        self.lottieView.isHidden = true
    }
}
