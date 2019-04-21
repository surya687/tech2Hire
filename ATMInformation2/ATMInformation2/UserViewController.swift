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
    case searchAtmByLocation = "SearchATMsByLocation"
    case searchAtmByWorkingStatus = "SearchATMsByWorkingStatus"
}

class UserViewController: UIViewController {
    var atms : [Atm] = []
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
        dataSource.atms = atms
        destinationVC.dataSource = dataSource
    }

    @IBAction func getAtms(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else{
            fatalError()
        }
        let user = User()
        switch ButtonTitle(rawValue: buttonTitle)! {
        case .allAtms:
            atms = user.getAllAtms()
            performSegue(withIdentifier: "atmListSegue", sender: self)
        case .searchAtmByBank:
            atms = user.getAtmsBy(associatedBank: "SBI")
            performSegue(withIdentifier: "atmListSegue", sender: self)
        case .searchAtmByLocation:
            atms = user.getAtmsBy(location: "Bhimavaram")
            performSegue(withIdentifier: "atmListSegue", sender: self)
        case .searchAtmByWorkingStatus:
            atms = user.getAtmsBy(workingStatus: .working)
            performSegue(withIdentifier: "atmListSegue", sender: self)
        }
    }
    
}
