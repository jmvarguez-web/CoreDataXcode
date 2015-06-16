//
//  List.swift
//  GroceryList
//
//  Created by jmvarguez on 6/15/15.
//  Copyright (c) 2015 jmvarguez. All rights reserved.
//

import Foundation
import CoreData
@objc(List)

class List: NSManagedObject {

    @NSManaged var item: String
    @NSManaged var note: String
    @NSManaged var qty: String

}
