//
//  BaseViewController.swift
//  CryptoCo
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit
import MaterialActivityIndicator
import SwiftAlertView

//İki ekrandan sonra basse yapıya geçmeyi göster
class BaseViewController: UIViewController {
    
    let indicator = MaterialActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicatorView()
    }

    func setupActivityIndicatorView() {
        view.addSubview(indicator)
        setupActivityIndicatorViewConstraints()
    }

    func setupActivityIndicatorViewConstraints() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showErrorAlert(message: String, completion: @escaping () -> Void) {
        SwiftAlertView.show(title: "Error",
                            message: message,
                            buttonTitles: "OK")
        .onButtonClicked { _, _ in
            completion()
        }
    }
}


