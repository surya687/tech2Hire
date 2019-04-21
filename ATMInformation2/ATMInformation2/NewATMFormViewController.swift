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
    

}
