//
//  AdminViewController.swift
//  ATMInformation2
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    var admin : Admin!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVc = segue.destination as! NewATMFormViewController
        destinationVc.admin = sender as? Admin
    }
 
    
    @IBAction func addAtm(_ sender: UIButton) {
        
        performSegue(withIdentifier: SegueIdentifiers.addAtmSegue, sender: admin)
    }
    
    

}
