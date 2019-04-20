//
//  FirstViewController.swift
//  ATMInformation
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit
import CoreData
var container: NSPersistentContainer!

class FirstViewController: UIViewController {
    @IBOutlet weak var bankAssociated: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var workingStatus: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("\(error)")
            }
        }
                
    }
    
    @IBAction func addATM(_ sender: UIButton) {
        
        let atm = Atm(context: container.viewContext)
        atm.bankAssociated = self.bankAssociated.text
        atm.location = self.location.text
        if self.workingStatus.text! == "yes"{
            atm.workingStatus = true
        }else{
            atm.workingStatus = false
        }
        
        saveModelObjectContext()
        clearTextFields()

    }
    private func clearTextFields(){
        self.bankAssociated.text = nil
        self.location.text  = nil
        self.workingStatus.text  = nil
    }
    
    private func saveModelObjectContext(){
        if container.viewContext.hasChanges{
            do{
                try container.viewContext.save()
            }catch{
                print("Error in saving the context")
            }
        }
    }
    


}

