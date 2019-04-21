//
//  MapManager.swift
//  ATMInformation2
//
//  Created by Apple on 21/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class MapManager{
    func locate(atm : Atm)->MKPlacemark {
        guard let latitude = atm.latitude,let longitude = atm.logitude else{
            fatalError("Invalid Latitude and Logitude")
        }
        let locationCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let locationName = ["Name" : "Bhimavaram", "Atm": "SBI"]
        let place = MKPlacemark(coordinate: locationCoordinates, addressDictionary: locationName)
        return place
    }
}
