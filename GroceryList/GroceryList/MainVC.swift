//
//  MainVC.swift
//  GroceryList
//
//  Created by jmvarguez on 6/15/15.
//  Copyright (c) 2015 jmvarguez. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController {
    
let contex = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var nItem : List? = nil
    
    @IBOutlet weak var entryItem: UITextField!
    @IBOutlet weak var entryNote: UITextField!
    @IBOutlet weak var entryQty: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nItem != nil{
            entryItem.text = nItem?.item
            entryNote.text = nItem?.item
            entryQty.text = nItem?.item
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        dismissVC()
    }
    
    
    @IBAction func saveTapped(sender: AnyObject) {
        if nItem != nil{
            editItem()
        } else{
            newItem()
        }
        dismissVC()
    }
    
    func dismissVC(){
        navigationController?.popViewControllerAnimated(true)
        
    }
    func newItem(){
        let context = self.contex
        let ent = NSEntityDescription.entityForName("List", inManagedObjectContext: contex!)
        
        let nItem = List(entity: ent!, insertIntoManagedObjectContext: contex)
        
        nItem.item = entryItem.text!
        nItem.note = entryNote.text
        nItem.qty = entryQty.text
        contex?.save(nil)
        
    }
    func editItem(){
        nItem!.item = entryItem.text
        nItem!.note = entryNote.text
        nItem!.qty = entryQty.text
        contex?.save(nil)
        
    }
    

}

