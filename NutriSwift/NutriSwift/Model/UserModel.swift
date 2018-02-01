//
//  User.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/30/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

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
    // first result is raw carrot (what we want?)
//    https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0
    // broccoli
 //    https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=broccoli&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0
// https://api.nal.usda.gov/ndb/reports/?ndbno=11124&type=b&format=json&api_key=DEMO_KEY
// this is actual food data accessed by demo key
    
    
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
        // Create a new managed object and insert it into the context, so it can be saved
        // into the database
        let entity =  NSEntityDescription.entity(forEntityName: "User",
                                                 in:managedContext)
        
        // Update the existing object with the data passed in from the View Controller
//        if let entity = existing
//        {
//            existing!.userName = userName
//            existing!.userAge = userAge
//            existing!.userGender = userGender
//        }
            // Create a new movie object and update it with the data passed in from the View Controller
//        else
//        {
            // Create an object based on the Entity
            let user = User(entity: entity!,
                              insertInto:managedContext)
            user.userName = userName
            user.userAge = userAge
            user.userGender = userGender
//        }
        
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
    
}

