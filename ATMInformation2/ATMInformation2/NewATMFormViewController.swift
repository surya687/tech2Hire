//
//  NewATMFormViewController.swift
//  ATMInformation2
//
//  Created by Apple on 21/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit

class NewATMFormViewController: UIViewController {
    var admin : Admin!
    
    @IBOutlet weak var associatedBank: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    
    
    @IBOutlet weak var workingStatus: UISegmentedControl!
    
    @IBOutlet weak var acFacility: UISwitch!
    @IBOutlet weak var multipleAtmsFacility: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAtm(_ sender: UIButton) {
        guard validateNewAtmForm() else{
            return
        }
        
        var facilities : [String:Bool] = [:]
        facilities.updateValue(acFacility.isOn, forKey: "Ac")
        facilities.updateValue(multipleAtmsFacility.isOn, forKey: "MultipleAtms")
        let workingStat = workingStatus.titleForSegment(at: workingStatus.selectedSegmentIndex)
        
        
        let atm = Atm(bankName: associatedBank.text!,
                      location: location.text!,
                      latitude: Double(latitude.text!)!,
                      logitude: Double(longitude.text!)!,
                      workingStatus: workingStat!,
                      facilities: facilities)
        admin.addAtm(atm: atm)
        
    }
    
    private func validateNewAtmForm()->Bool {
        guard let bank = associatedBank.text,bank != "" else {
            print("Enter valid Associated bank name")
            return false
        }
        guard let location = location.text,location != "" else {
            print("Enter valid Location")
            return false
        }
        guard let latitude = latitude.text,latitude != "" else {
            print("Enter valid latitude")
            return false
        }
        guard let longitude = longitude.text,longitude != "" else {
            print("Enter valid longitude")
            return false
        }
        return true
    }

}
