//
//  User+CoreDataProperties.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/30/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userAge: Int16
    @NSManaged public var userGender: String?

}
