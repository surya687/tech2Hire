//
//  AtmDetailViewController.swift
//  ATMInformation2
//
//  Created by Apple on 21/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit

class AtmDetailViewController: UIViewController {
    var atm : Atm!
    @IBOutlet weak var bankName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var workingStatus: UILabel!
    
    @IBOutlet weak var acFacility: UILabel!
    @IBOutlet weak var multipleAtmFacility: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentAtmDetails()
        // Do any additional setup after loading the view.
    }
    
    private func presentAtmDetails(){
        bankName.text = atm.bankName
        location.text = atm.location
        workingStatus.text = atm.workingStatus
        if let ac = atm.facilities?["Ac"]{
            self.acFacility.isHidden = !ac
        }
        if let multipleAtms = atm.facilities?["MultipleAtms"]{
            self.multipleAtmFacility.isHidden = !multipleAtms
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
