//  Created by Hayden Farrier on 1/30/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//  Code adapted from RMIT coursework (tutorial)

import Foundation
import UIKit
import CoreData

class UserModel
{
    
    static let sharedInstance = UserModel()
    private init()
    {
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    // Get a reference to your App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Hold a reference to the managed context
    let managedContext: NSManagedObjectContext
    
    // Create a collection of objects to store in the database
    var userDB = [User]()
    
    var genders = ["Male", "Female", "Other"]
    
    // MARK: - CRUD **************************************************************
    
    func saveUser(_ userName: String, userAge: Double, userGender: String)
    {
 
        let entity =  NSEntityDescription.entity(forEntityName: "User",
                                                 in:managedContext)
        let user = User(entity: entity!,
                          insertInto:managedContext)
        user.userName = userName
        user.userAge = userAge
        user.userGender = userGender
        updateDatabase()
    }
        // MARK: - CRUD *****************************************************************************************
    
    func getUsers()
    {
        do
        {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"User")
            
            let results =
                try managedContext.fetch(fetchRequest)
            userDB = results as! [User]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    func deleteUser(_ user: User)
    {
        managedContext.delete(user)
        updateDatabase()
    }
    

    // Save the current state of the objects in the managed context into the
    // database.
    func updateDatabase()
    {
        do
        {
            try managedContext.save()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func resetUserDB() {
        self.getUsers()
        for user in self.userDB {
            self.deleteUser(user)
        }
        self.getUsers()
    }
    
}

