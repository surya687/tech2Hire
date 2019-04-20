//
//  FirstViewController.swift
//  ATMInformation
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import UIKit
import CoreData
var context : NSManagedObjectContext!
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        guard context != nil else {
            fatalError("This view needs a manged object context.")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "ATM", in: context) else{
            fatalError()
        }
        let newATM = NSManagedObject(entity: entity, insertInto: context)
        newATM.setValue("SBI", forKey: "bankAssociated")
        newATM.setValue("location1", forKey: "location")
        newATM.setValue(false, forKey: "workingStatus")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "ATM")
        
        do{
            let result = try context.fetch(fetchReq)
            for data in result as! [NSManagedObject]{
                print(data.value(forKey: "bankAssociated") as! String)
                print(data.value(forKey: "location") as! String)
                print(data.value(forKey: "workingStatus") as! Bool)
            }
        }catch{
            print("fetch failes")
        }
        
    }


}

