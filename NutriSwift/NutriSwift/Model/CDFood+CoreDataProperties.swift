//
//  CDFood+CoreDataProperties.swift
//  NutriSwift
//
//  Created by Asli Yoruk on 1/31/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//
//

import Foundation
import CoreData


extension CDFood{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFood> {
        return NSFetchRequest<CDFood>(entityName: "CDFood")
    }

    @NSManaged public var foodName: String?
    @NSManaged public var vitaminA: Double
    @NSManaged public var thiamin: Double
    @NSManaged public var riboflavin: Double
    @NSManaged public var niacin: Double
    @NSManaged public var vitaminB6: Double
    @NSManaged public var foodWeight: Double
    @NSManaged public var mealType: String?

}
