//
//  model.swift
//  ATMInformation2
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import Foundation
struct Atm {
    let bankName : String?
    let location : String?
    let workingStatus : String?
    let facilities : [String : Bool]?
    
    init(bankName:String,location:String,workingStatus : String,facilities : [String:Bool]) {
        self.bankName = bankName
        self.location = location
        self.workingStatus = workingStatus
        self.facilities = facilities
    }
}

class Model{
    var atms : [Atm] = []
    static let shared : Model = Model()
    private init(){
    }
    
}

enum WorkingStatus : String{
    case working = "Working"
    case notWorking = "Not Working"
}
class User {
    func loginAsUser()->Bool{
        return true
    }
    func getAllAtms()->[Atm]{
        return Model.shared.atms
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
    func loginAsAdmin()->Bool{
        return true
    }
    func addAtm(atm:Atm){
        Model.shared.atms.append(atm)
    }
    
}
