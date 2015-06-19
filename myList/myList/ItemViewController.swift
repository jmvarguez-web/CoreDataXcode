//
//  ItemViewController.swift
//  myList
//
//  Created by jmvarguez on 6/16/15.
//  Copyright (c) 2015 jmvarguez. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController {
    
    
    @IBOutlet var textFieldItem: UITextField!
    @IBOutlet var textFieldQuantity: UITextField!
    @IBOutlet var textFieldInfo: UITextField!
    
    var item: String = ""
    var quantity: String = ""
    var info: String = ""
    
    
    var existingItem: NSManagedObject!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (existingItem != nil) {
            textFieldItem.text = item
            textFieldQuantity.text = quantity
            textFieldInfo.text = info
            
        }

        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(sender: AnyObject) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        
        let en = NSEntityDescription.entityForName("List", inManagedObjectContext: contxt)
        
        if (existingItem != nil) {
            
           existingItem.setValue(textFieldItem.text as String, forKey: "item")
           existingItem.setValue(textFieldQuantity.text as String, forKey: "quantity")
           existingItem.setValue(textFieldInfo.text as String, forKey: "info")
            
        } else{
            var newItem = Model(entity: en!, insertIntoManagedObjectContext: contxt)
            newItem.item = textFieldItem.text
            newItem.quantity = textFieldQuantity.text
            newItem.info = textFieldInfo.text
            println(newItem)
            
        }
        
        contxt.save(nil)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
