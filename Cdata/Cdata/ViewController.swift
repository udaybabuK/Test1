//
//  ViewController.swift
//  Cdata
//
//  Created by Orient Technologies Mac on 6/15/18.
//  Copyright © 2018 Orient. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    var data = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for c in 0  ..< 10 {
            print(c)
        }
        
       //InsertData()
       //FetchData()
        FetchPerminent()
       // UpdateList()
     // SavePerminent()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func InsertData() -> Void {
        let user = User(context:context)
        user.name = "udai"
        user.address = "piler"
        let user1 = User(context:context)
        user1.name = "rama"
        user1.address = "tpt"
        do
        {
            try context.save()
            print("SAVED")
        }
        catch{
            //process error
        }
    }
    
    func FetchData() -> Void {
        do{
            data = try context.fetch(User.fetchRequest())
        
            for each in data{
                print("name :\(each.name!)---address :\(each.address!)--age :\(each.name!)")
            }
        }catch{
            //error handle
        }
    }
   
    func SavePerminent() -> Void {
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
          newUser.setValue("yes", forKey: "name")
          newUser.setValue("piler", forKey: "address")
        let newUser1 = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
          newUser1.setValue("no", forKey: "name")
          newUser1.setValue("tpt", forKey: "address")
        
        do
        {
            try context.save()
            print("SAVED")
        }
        catch{
            //process error 
        }
    }
    func FetchPerminent() -> Void {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate(format: "%K CONTAINS[c] %@ AND %K CONTAINS[c] %@", "name", "yes", "address", "piler")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            if results.count>0 {
                for result in results as! [NSObject]{
                    if let userName = result.value(forKey: "name"){
                        print(userName)
                    }
                }
            }
        }catch{
            //process error
        }
    }
    
    func UpdateList() -> Void {
        let name = "udai"
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        let predicate = NSPredicate(format: "name = '\(name)'")
        fetchRequest.predicate = predicate
        do
        {
            let test = try context.fetch(fetchRequest)
            if test.count == 1
            {
                let objectUpdate = test[0] as! NSManagedObject
                objectUpdate.setValue("newName is Udai Babu", forKey: "name")
               // objectUpdate.setValue("newDepartment is bang", forKey: "address")
                do{
                    try context.save()
                }
                catch
                {
                    print(error)
                }
            }
        }
        catch
        {
            print(error)
        }
    }
}

