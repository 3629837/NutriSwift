//
//  CDNutrient+CoreDataProperties.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/31/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//
//

import Foundation
import CoreData


extension CDNutrient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDNutrient> {
        return NSFetchRequest<CDNutrient>(entityName: "CDNutrient")
    }

    @NSManaged public var nutrientName: String?
    @NSManaged public var nutrientUL: Double
    @NSManaged public var nutrientCurrent: Double
    @NSManaged public var nutrientRDI: Double

}
