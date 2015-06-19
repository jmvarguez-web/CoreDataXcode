//
//  Model.swift
//  myList
//
//  Created by jmvarguez on 6/16/15.
//  Copyright (c) 2015 jmvarguez. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)

class Model: NSManagedObject {
    
    @NSManaged var  item: String
    @NSManaged var  quantity: String
    @NSManaged var  info: String
    
    
    
   
}
