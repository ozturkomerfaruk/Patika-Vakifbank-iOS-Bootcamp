//
//  StudentMapVC.swift
//  OnTheMap

import UIKit
import MapKit

final class StudentMapVC: BaseVC, RefreshableProtocol {

    // MARK: Properties
    @IBOutlet private weak var mapView: MKMapView!
    private var locations: [StudentInformation]!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getStudentLocations()
    }

    // MARK: Methods
    private func getStudentLocations() {
        NetworkClient.getStudentLocations { (locations, error) in
            if let error = error {
                self.showErrorAlert(title: "Error", description: error.localizedDescription)
                return
            }
            self.locations = locations
            self.prepareAnnotations()
        }
    }

    private func prepareAnnotations() {
        var annotations = [MKPointAnnotation]()
        for location in locations {

            let lat = location.latitude
            let long = location.longitude

            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)

            let first = location.firstName
            let last = location.lastName
            let mediaURL = location.mediaURL

            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(first) \(last)"
            annotation.subtitle = mediaURL

            annotations.append(annotation)
        }
        self.mapView.addAnnotations(annotations)
    }

    func refresh() {
        locations.removeAll()
        mapView.removeAnnotations(mapView.annotations)
        getStudentLocations()
    }

}

// MARK: - MKMapViewDelegate
extension StudentMapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let reuseId = "pin"

        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }

        return pinView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            if let toOpen = view.annotation?.subtitle! {
                app.open(URL(string: toOpen)!, options: [:], completionHandler: nil)
            }
        }
    }

    
}
