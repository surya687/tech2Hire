//
//  model.swift
//  ATMInformation2
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import Foundation
struct Atm {
    var bankName : String?
    var location : String?
    var workingStatus : String?
}

class Model{
    var atms : [Atm] = []
    
}

enum WorkingStatus : String{
    case working = "Working"
    case notWorking = "Not Working"
}
class User {
    func getAllAtms()->[Atm]{
        let atms : [Atm] = []
        return atms
    }
    func getAtmsBy(associatedBank : String)->[Atm]{
        let atms : [Atm] = []
        return atms
    }
    func getAtmsBy(location: String)->[Atm]{
        let atms : [Atm] = []
        return atms
    }
    func getAtmsBy(workingStatus : WorkingStatus)->[Atm]{
        let atms : [Atm] = []
        return atms
    }
}

class Admin{
    func addAtm(atm:Atm){
        
    }
    
}
