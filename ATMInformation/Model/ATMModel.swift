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
    private var bankAssociated : String!
    private var location : CLLocation!
    private var isWorking : Bool!
    private var facilities : [String:Bool]!
    
    init(){
        self.bankAssociated = ""
        self.location = nil
        self.isWorking = nil
        self.facilities = nil
    }
    func getBankAssociated()-> String{
        return self.bankAssociated
    }
    func getLocation()-> CLLocation{
        return self.location
    }
    func getIsWorking()-> Bool{
        return self.isWorking
    }
    func getFacilities()-> [String:Bool]{
        return self.facilities
    }
}

class ATMModel{
    func addATM(atm:ATM){
        
    }
    func searchATM(byBankName : String)->[ATM]{
        var atms : [ATM] = []
        return atms
    }
    
}
