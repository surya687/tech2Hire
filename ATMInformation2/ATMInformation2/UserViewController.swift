//
//  UserViewController.swift
//  ATMInformation2
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit
enum ButtonTitle : String{
    case allAtms = "AllAtms"
    case searchAtmByBank = "SearchATMsByBank"
    case searchATMsByUserLocation = "SearchATMsByUserLocation"
    case searchAtmByWorkingStatus = "SearchATMsByWorkingStatus"
}

class UserViewController: UIViewController {
    private var atms : [Atm]!
    var user : User!
    
    @IBOutlet weak var bankAssociated: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! ATMListViewController
        let dataSource = ATMListDataSource()
        dataSource.dataSourceDelegate = destinationVC
        dataSource.atms = atms
        destinationVC.dataSource = dataSource
    }

    @IBAction func getAtms(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else{
            fatalError()
        }
        
        switch ButtonTitle(rawValue: buttonTitle)! {
        case .allAtms:
            atms = user.getAllAtms()
            performSegue(withIdentifier: SegueIdentifiers.atmListSegue, sender: self)
        case .searchAtmByBank:
            guard let bankName = bankAssociated.text,bankName != "" else{
                print("Enter valid Bank name")
                return
            }
            atms = user.getAtmsBy(associatedBank: bankName )
            performSegue(withIdentifier: SegueIdentifiers.atmListSegue, sender: self)
        case .searchATMsByUserLocation:
//            atms = user.getAtmsBy(location: "Bhimavaram")
            atms = user.getAtmsByUserLocation()
            performSegue(withIdentifier: SegueIdentifiers.atmListSegue, sender: self)
        case .searchAtmByWorkingStatus:
            atms = user.getAtmsBy(workingStatus: .working)
            performSegue(withIdentifier: SegueIdentifiers.atmListSegue, sender: self)
        }
    }
    
}
