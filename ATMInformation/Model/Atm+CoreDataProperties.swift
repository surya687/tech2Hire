//
//  Atm+CoreDataProperties.swift
//  ATMInformation
//
//  Created by Apple on 20/04/19.
//  Copyright © 2019 Surya. All rights reserved.
//
//

import Foundation
import CoreData


extension Atm {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Atm> {
        return NSFetchRequest<Atm>(entityName: "Atm")
    }

    @NSManaged public var bankAssociated: String?
    @NSManaged public var workingStatus: Bool
    @NSManaged public var location: String?

}
