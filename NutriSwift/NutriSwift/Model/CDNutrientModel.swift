import Foundation
import UIKit
import CoreData

class CDNutrientModel
{
    
    static let sharedInstance = CDNutrientModel()
    private init()
    {
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    // Get a reference to your App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Hold a reference to the managed context
    let managedContext: NSManagedObjectContext
    
    // Create a collection of objects to store in the database
    var nutrientDB = [CDNutrient]()
    
    func getNutrient(_ indexPath: IndexPath) -> CDNutrient
    {
        return nutrientDB[indexPath.row]
    }
    
    // MARK: - CRUD **************************************************************
    
    func saveNutrient(_ nutrientName: String, nutrientRDI: Double, nutrientUL: Double, nutrientCurrent: Double, existing: CDNutrient?)
    {
        // Create a new managed object and insert it into the context, so it can be saved
        // into the database
        let entity =  NSEntityDescription.entity(forEntityName: "CDNutrient",
                                                 in:managedContext)
        
        // Update the existing object with the data passed in from the View Controller
        if let _ = existing
        {
            existing!.nutrientName = nutrientName
            existing!.nutrientRDI = nutrientRDI
            existing!.nutrientUL = nutrientUL
            existing!.nutrientCurrent = nutrientCurrent
        }
            // Create a new movie object and update it with the data passed in from the View Controller
        else
        {
            // Create an object based on the Entity
            let nutrient = CDNutrient(entity: entity!,
                            insertInto:managedContext)
            nutrient.nutrientName = nutrientName
            nutrient.nutrientRDI = nutrientRDI
            nutrient.nutrientUL = nutrientUL
            nutrient.nutrientCurrent = nutrientCurrent
        }
        
        updateDatabase()
    }
    // MARK: - CRUD *****************************************************************************************
    
    func getCDNutrients()
    {
        do
        {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"CDNutrient")
            
            let results =
                try managedContext.fetch(fetchRequest)
            nutrientDB = results as! [CDNutrient]
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    func deleteCDNutrient(_ CDNutrient: CDNutrient)
    {
        managedContext.delete(CDNutrient)
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


