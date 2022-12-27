//
//  PostLocationVC.swift
//  OnTheMap

import CoreLocation
import UIKit

final class PostLocationVC: BaseVC {

    // MARK: Properties
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var locationTextField: UITextField!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
    }

    // MARK: Methods
    @IBAction private func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func findOnTheMapPressed(_ sender: Any) {
        activityIndicator.startAnimating()
        let address = locationTextField.text ?? ""
        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            self.activityIndicator.stopAnimating()
            if let error = error {
                self.showErrorAlert(title: "Error", description: error.localizedDescription)
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                let submitVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SubmitViewController") as! SubmitVC
                submitVC.lat = coordinates.latitude
                submitVC.lon = coordinates.longitude
                submitVC.mapString = address
                submitVC.modalPresentationStyle = .fullScreen
                self.present(submitVC, animated: true, completion: nil)
            }
        })
    }
}

extension PostLocationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
}
