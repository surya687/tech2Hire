//
//  ATMModel.swift
//  ATMInformation
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//

import Foundation
import CoreLocation

struct ATM{
    var bankAssociated : String!
    var location : CLLocation!
    var isWorking : Bool!
    var facilities : [String:Bool]!
    
    init( bankAssociated : String,location : CLLocation,isWorking : Bool,facilities : [String:Bool]){
        self.bankAssociated = bankAssociated
        self.location = location
        self.isWorking = isWorking
        self.facilities = facilities
    }
    
}

class ATMModel{
    func addATM(atm:ATM){
        
    }
    func searchATM(byBankName : String)->[ATM]{
        let atms : [ATM] = []
        return atms
    }
    
}
