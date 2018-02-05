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
    var foodDBUnsorted = [CDFood]()
    
    var foodDBSorted : [[CDFood]] =
        [
            [
            ],
            [
            ],
            [
            ],
            [
            ]
    ]
    
    var sectionNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    
    func getFood(_ indexPath: IndexPath) -> CDFood
    {
        return  foodDBUnsorted[indexPath.row]
    }
    
    // MARK: - CRUD **************************************************************
    
    func saveFood(_ foodName: String, foodWeight: Double, mealType: String, niacin: Double, riboflavin: Double, thiamin: Double, vitaminA: Double, vitaminB6: Double)
    {
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
        food.thiamin = thiamin
        
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
            foodDBUnsorted = results as! [CDFood]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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
    
    func populateFoodDB()
    {
        self.foodDBSorted = [[],[],[],[]]
        
        for food in FoodModel.sharedInstance.foodDBUnsorted {
            switch food.mealType! {
            case "Breakfast":
                self.foodDBSorted[0].append(food)
            case "Lunch":
                self.foodDBSorted[1].append(food)
            case "Dinner":
                self.foodDBSorted[2].append(food)
            case "Snacks":
                self.foodDBSorted[3].append(food)
            default:
                print("failure populateFoodDB")
            }
        }
        
    }
    
    
    
    
}

