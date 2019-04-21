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
    let latitude : Double?
    let logitude : Double?
    let workingStatus : String?
    let facilities : [String : Bool]?
    
    init(bankName:String,location:String,latitude:Double,logitude:Double,workingStatus : String,facilities : [String:Bool]) {
        self.bankName = bankName
        self.location = location
        self.workingStatus = workingStatus
        self.facilities = facilities
        self.latitude = latitude
        self.logitude = logitude
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
    let mapManager : MapManager!
    
    init(mapManager : MapManager){
        self.mapManager = mapManager
    }
    
    func loginAsUser()->Bool{
        return true
    }
    func getAllAtms()->[Atm]{
        return Model.shared.atms
    }
    func getAtmsBy(associatedBank : String)->[Atm]{
        let atms : [Atm] = Model.shared.atms.filter({(atm: Atm)->Bool in atm.bankName == associatedBank})
        return atms
    }

    //Filters the Atms around 100km distance from the user
    func getAtmsByUserLocation()->[Atm]{
         let atms : [Atm] = Model.shared.atms.filter({(atm: Atm)->Bool in mapManager.getAtmDistanceFromUser(atm: atm) < 100000})
        return atms
    }
    func getAtmsBy(workingStatus : WorkingStatus)->[Atm]{
        let atms : [Atm] = Model.shared.atms.filter({(atm: Atm)->Bool in atm.workingStatus == workingStatus.rawValue})
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
