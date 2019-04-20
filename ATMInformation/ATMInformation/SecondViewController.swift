//
//  SecondViewController.swift
//  ATMInformation
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit
import CoreLocation

class SecondViewController: UIViewController,CLLocationManagerDelegate {
    var userCurrentLocation : CLLocationCoordinate2D?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let locationManager = CLLocationManager()
        //request permission to use location services
        locationManager.requestAlwaysAuthorization()
        
        //
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestLocation()
            
        }
            
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else{
            fatalError()
        }
        userCurrentLocation = location
        print(location)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    


}

