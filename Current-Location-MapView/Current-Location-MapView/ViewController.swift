//
//  ViewController.swift
//  Current-Location-MapView
//
//  Created by Mac on 23/05/23.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManger = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
    }


}

extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //current Location
//        let coordinate:CLLocationCoordinate2D = manager.location!.coordinate
//
        // You want To This Location
        
        let coordinate = CLLocationCoordinate2D(latitude: 18.1516827894, longitude: 74.2752163215
)
        let spanDegree = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: spanDegree)
        
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Someshwar Temple "
        mapView.addAnnotation(annotation)
    }
}
