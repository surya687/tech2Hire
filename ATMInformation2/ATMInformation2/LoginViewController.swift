//
//  LoginViewController.swift
//  ATMInformation2
//
//  Created by Apple on 21/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var adminOrUser: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.adminFlowSegue{
            let destinationVc = segue.destination as! AdminViewController
            destinationVc.admin = sender as? Admin
            
        }else{
            let destinationVc = segue.destination as! UserViewController
            destinationVc.user = sender as? User
        }
    }

    
    @IBAction func login(_ sender: UIButton) {
        if adminOrUser.text == "Admin"{
            let admin = Admin()
            if admin.loginAsAdmin(){
                performSegue(withIdentifier: SegueIdentifiers.adminFlowSegue, sender: admin)
            }
        }else if adminOrUser.text == "User"{
            let user = User()
            performSegue(withIdentifier: SegueIdentifiers.userFlowSegue, sender: user)
        }else{
            print("Enter Admin or User")
        }
    }
    

}
