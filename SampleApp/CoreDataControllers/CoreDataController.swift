//
//  CoreDataController.swift
//  SampleApp
//
//  Created by Shatakshi on 21/09/17.
//  Copyright © 2017 Shatakshi. All rights reserved.
//

import UIKit
import CoreData

class CoreDataControllers: UIViewController {
    
    var people: [NSManagedObject] = []

    class func getLoginData(){
        let managedContext = AppDelegate.appDelegate().persistentContainer.viewContext
    
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Login")
        do {
            people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    class func saveLoginData(_ name: String, email: String) -> Bool
    {
        let managedContext = AppDelegate.appDelegate().persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Login",
                                                in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        person.setValue(name, forKeyPath: "name")
        person.setValue(name, forKeyPath: "email")
        
        do {
            try managedContext.save()
            people.append(person)
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
 
}
