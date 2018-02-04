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
    var name = " "
    // Get a reference to your App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Hold a reference to the managed context
    let managedContext: NSManagedObjectContext
    
    // Create a collection of objects to store in the database
    var foodDB1D = [CDFood]()
    
    
    
    
    
    var sectionNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    
    func getFood(_ indexPath: IndexPath) -> CDFood
    {
        return  foodDB1D[indexPath.row]
    }
    
    // MARK: - CRUD **************************************************************
    
    func saveFood(_ foodName: String, foodWeight: Double, mealType: String, niacin: Double, riboflavin: Double, thiamin: Double, vitaminA: Double, vitaminB6: Double)
    {
        print("I have been called")
        let entity =  NSEntityDescription.entity(forEntityName: "CDFood",
                                                 in:managedContext)
        let food = CDFood(entity: entity!, insertInto:managedContext)
        food.foodName = foodName
        food.foodWeight = foodWeight
        food.mealType = mealType
        food.niacin = niacin
        food.riboflavin = riboflavin
        food.vitaminA = vitaminA
        food.vitaminB6 = vitaminB6
        
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
            foodDB1D = results as! [CDFood]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
//    func printFoods() {
//        print("Foods: \(foodDB1D)");
//    }
    
    func deleteFood(_ food: CDFood)
    {
        managedContext.delete(food)
        updateDatabase()
    }
    
    //    func count( mealType: String ) -> Int
    //    {
    //        var count = 0
    //
    //        for food in FoodModel.sharedInstance.foodDB {
    //            if f == mealType
    //            {
    //                count += 1
    //            }
    //        }
    //        return count;
    //    }
    
    
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

