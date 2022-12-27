//
//  SubmitVC.swift
//  OnTheMap

import UIKit
import MapKit

final class SubmitVC: BaseVC {

    // MARK: Properties
    @IBOutlet private weak var linkTextField: UITextField!
    @IBOutlet private weak var mapView: MKMapView!
    private var studentLocationModel: StudentInformation!
    var lat: Double = 0
    var lon: Double = 0
    var mapString: String = ""

    // MARK: Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        prepareMap()
    }

    // MARK: Methods
    private func prepareMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.050, longitudeDelta: 0.050))
        mapView.setRegion(region, animated: true)
    }

    @IBAction private func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func submitButtonPressed(_ sender: Any) {
        studentLocationModel = StudentInformation(firstName: NetworkClient.Auth.firstName, lastName: NetworkClient.Auth.lastName, latitude: lat, longitude: lon, mapString: mapString, mediaURL: linkTextField.text ?? "", uniqueKey: NetworkClient.Auth.key)
        NetworkClient.postLocation(location: studentLocationModel) { (success, error) in
            if success {
                self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            } else if let error = error {
                self.showErrorAlert(title: "Error", description: error.localizedDescription)
                return
            }
        }
    }
}

extension SubmitVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
}
