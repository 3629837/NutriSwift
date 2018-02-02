//
//  FoodViewModel.swift
//  NutriSwift
//
//  Created by Asli Yoruk on 1/31/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FoodModel
{
    static let sharedInstance = FoodModel()
    private init()
    {
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    var meal = ""
    // Get a reference to your App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Hold a reference to the managed context
    let managedContext: NSManagedObjectContext
    
    // Create a collection of objects to store in the database
    var foodDB = [CDFood]()
    
    var sectionNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    
    func getFood(_ indexPath: IndexPath) -> CDFood
    {
       return foodDB[indexPath.row]
    }
    
    // MARK: - CRUD **************************************************************
    
    func saveFood(_ foodName: String, foodWeight: Double, mealType: String, niacin: Double, riboflavin: Double, thiamin: Double, vitaminA: Double, vitaminB6: Double, existing: CDFood?)
    {
        // Create a new managed object and insert it into the context, so it can be saved
        // into the database
        let entity =  NSEntityDescription.entity(forEntityName: "CDFood",
                                                 in:managedContext)
        
        // Update the existing object with the data passed in from the View Controller
//        if let _ = existing
//        {
//            existing!.foodName = foodName
//            existing!.foodWeight = foodWeight
//            existing!.mealType = mealType
//            existing!.niacin = niacin
//            existing!.riboflavin = riboflavin
//            existing!.thiamin = thiamin
//            existing!.vitaminA = vitaminA
//            existing!.vitaminB6 = vitaminB6
//        }
//            // Create a new movie object and update it with the data passed in from the View Controller
//        else
//        {
            // Create an object based on the Entity
            let food = CDFood(entity: entity!, insertInto:managedContext)
            food.foodName = foodName
            food.foodWeight = foodWeight
            food.mealType = mealType
            food.niacin = niacin
            food.riboflavin = riboflavin
            food.vitaminA = vitaminA
            food.vitaminB6 = vitaminB6
//        }
        
        updateDatabase()
    }
    // MARK: - CRUD *****************************************************************************************
    
    func getFoods()
    {
        do
        {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"CDFood")
            
            let results =
                try managedContext.fetch(fetchRequest)
            foodDB = results as! [CDFood]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func printFoods() {
        print("Foods: \(foodDB)");
    }
    
    func deleteFood(_ food: CDFood)
    {
        managedContext.delete(food)
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

