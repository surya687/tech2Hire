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
    }

    
    
    @IBAction func searchATMByBank(_ sender: UIButton) {
        let atms = searchATMby(associatedBank : "ICICI")
        for atm in atms{
            print(atm.bankAssociated!)
            print(atm.location!)
            print(atm.workingStatus)
        }
    }
    
    @IBAction func searchATMByWorkingStatus(_ sender: Any) {
        let atms = searchATMby(location: "Bhimavaram")
        for atm in atms{
            print(atm.bankAssociated!)
            print(atm.location!)
            print(atm.workingStatus)
        }
    }
    
    
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
            
        } catch {
            print("Fetch failed")
        }
        return atms

    }
    
    func searchATMby(location : String)->[Atm]{
        var atms : [Atm] = []
        
        let request = Atm.createFetchRequest()
        var workingStatusPredicate : NSPredicate?
        
        workingStatusPredicate = NSPredicate(format: "location == %@",location)
        let sort = NSSortDescriptor(key: "location", ascending: false)
        request.sortDescriptors = [sort]
        request.predicate = workingStatusPredicate
        
        do {
            atms = try container.viewContext.fetch(request)
            print("Got \(atms.count) atms")
        } catch {
            print("Fetch failed")
        }
        return atms
        
    }


}

