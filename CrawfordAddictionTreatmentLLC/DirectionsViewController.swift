//
//  DirectionsViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/2/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DirectionsViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    var manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // location where pin is dropped
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.230607, -93.219534)
        
        // pin annotations
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = "Crawford Addiction Treatment"
        objectAnnotation.subtitle = "Lake Charles, LA"
        self.mapView.addAnnotation(objectAnnotation)
    }
    
    @IBAction func directions(_ sender: AnyObject) {
        
        // set up URL link for directions
        if let url = URL(string: "http://maps.apple.com/maps?daddr=30.230607,-93.219534") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            displayAlert(message: "Something's not quite right. Please try again later.")
        }
        
    }
    
    @IBAction func mapType(_ sender: AnyObject) {
        
        if (segmentControl.selectedSegmentIndex == 0)
        {
            mapView.mapType = MKMapType.standard
        }
        if (segmentControl.selectedSegmentIndex == 1)
        {
            mapView.mapType = MKMapType.satellite
        }
        if (segmentControl.selectedSegmentIndex == 2)
        {
            mapView.mapType = MKMapType.hybrid
        }
        
    }
    
    @IBAction func locateMe(_ sender: AnyObject) {
        
        // trigger the locate me button
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
    }
    
    //once we get user location, set up zoom effect
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // once we get location, stop updating so it will display
        manager.stopUpdatingLocation()
        
        // get long and lat of th "userLocation"
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        // how far to zoom in
        let span = MKCoordinateSpanMake(0.5, 0.5)
        
        // set up region of zoom
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    // MARK: Display alert
    
    func displayAlert(message: String, completionHandler: ((UIAlertAction) -> Void)? = nil) {
        performUIUpdatesOnMain {
            
            let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it", style: .default, handler: completionHandler))
            self.present(alert, animated: true, completion: nil)
        }
    }

}
