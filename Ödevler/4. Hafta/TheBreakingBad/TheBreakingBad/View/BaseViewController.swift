//
//  BaseViewController.swift
//  TheBreakingBad
//
//  Created by Ömer Faruk Öztürk on 24.11.2022.
//

import UIKit
import MaterialActivityIndicator
import SwiftAlertView

class BaseViewController: UIViewController {
    //Values
    let indicator = MaterialActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicatorView()
    }
    //MARK: Setup Indicator
    private func setupActivityIndicatorView() {
        view.addSubview(indicator)
        constraintActivityIndicatorView()
    }
    //MARK: Constraint Indicator
    private func constraintActivityIndicatorView() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    //MARK: Alert Dialog
    func showErrorAlert(message: String, completion: @escaping () -> Void) {
        SwiftAlertView.show(title: "Error", message: message, buttonTitles: ["Ok"]).onButtonClicked {
            _, _ in
            completion()
        }
    }
}
