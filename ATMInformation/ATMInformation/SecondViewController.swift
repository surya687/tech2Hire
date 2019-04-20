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
//
//        let locationManager = CLLocationManager()
//        //request permission to use location services
//        locationManager.requestAlwaysAuthorization()
//
//
//        if CLLocationManager.locationServicesEnabled(){
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.requestLocation()
//
//        }
        
        searchATMby(associatedBank: "ICICI")
        
    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last?.coordinate else{
//            fatalError()
//        }
//        userCurrentLocation = location
//        print(location)
//    }
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
    
    
    
    func searchATMby(associatedBank : String)->[Atm]{
        var atms : [Atm] = []
        
        let request = Atm.createFetchRequest()
        var bankAssociatedPredicate : NSPredicate?
        
        bankAssociatedPredicate = NSPredicate(format: "bankAssociated == %@",associatedBank)
        let sort = NSSortDescriptor(key: "bankAssociated", ascending: false)
        request.sortDescriptors = [sort]
        request.predicate = bankAssociatedPredicate
        
        do {
            atms = try container.viewContext.fetch(request)
            print("Got \(atms.count) atms")
            for atm in atms{
                print(atm.bankAssociated)
                print(atm.location)
                print(atm.workingStatus)
            }
        } catch {
            print("Fetch failed")
        }
        return atms

    }
    


}

