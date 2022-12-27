//
//  MapKitViewController.swift
//  Components
//
//  Created by Kaan YILDIRIM on 20.11.2022.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    //Pin example - Map Zoom Out To see Stadiums
    let stadiums = [Stadium(name: "Emirates Stadium", lattitude: 51.5549, longtitude: -0.108436),
    Stadium(name: "Stamford Bridge", lattitude: 51.4816, longtitude: -0.191034),
    Stadium(name: "White Hart Lane", lattitude: 51.6033, longtitude: -0.065684),
    Stadium(name: "Olympic Stadium", lattitude: 51.5383, longtitude: -0.016587),
    Stadium(name: "Old Trafford", lattitude: 53.4631, longtitude: -2.29139),
    Stadium(name: "Anfield", lattitude: 53.4308, longtitude: -2.96096)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        fetchStadiumsOnMap(stadiums)
    }
    
    func checkLocationServices() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            if CLLocationManager.locationServicesEnabled() {
                self.setupLocationManager()
                self.checkLocationAuthorization()
            }
        }
    }
    
    func setupLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            trackLocation()
            break
        }
    }
    
    func trackLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
    }
    
    func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func fetchStadiumsOnMap(_ stadiums: [Stadium]) {
      for stadium in stadiums {
        let annotations = MKPointAnnotation()
        annotations.title = stadium.name
        annotations.coordinate = CLLocationCoordinate2D(latitude:
          stadium.lattitude, longitude: stadium.longtitude)
        mapView.addAnnotation(annotations)
      }
    }
}
