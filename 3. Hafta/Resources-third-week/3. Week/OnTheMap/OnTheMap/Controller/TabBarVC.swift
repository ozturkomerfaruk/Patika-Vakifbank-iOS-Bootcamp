//
//  TabBarVC.swift
//  OnTheMap

import UIKit

final class TabBarVC: UITabBarController {

    // MARK: Methods
    @IBAction private func logoutButtonPressed(_ sender: Any) {
        NetworkClient.logout { (success, error) in
            if success {
                self.navigationController?.popToRootViewController(animated: true)
            } else if let error = error {
                self.showErrorAlert(title: "Error", description: error.localizedDescription)
                return
            }
        }
    }

    @IBAction private func refreshButtonPressed(_ sender: Any) {
        guard let viewControllers = self.viewControllers else { return }
        for controller in viewControllers {
            (controller as? RefreshableProtocol)?.refresh()
        }
    }

    @IBAction private func addPinButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "postLocation", sender: nil)
    }

    private func showErrorAlert(title: String, description: String) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
