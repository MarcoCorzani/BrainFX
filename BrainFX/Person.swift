//
//  Person.swift
//  BrainFX
//
//  Created by Marco F.A. Corzani on 04.11.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import Foundation
import CoreData

class Spruch: NSManagedObject {
    
    @NSManaged var adjektiv: String
    @NSManaged var nomen: String
    @NSManaged var verb: String
    
}
