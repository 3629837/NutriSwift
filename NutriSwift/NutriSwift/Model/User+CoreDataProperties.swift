//
//  User+CoreDataProperties.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 2/4/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userAge: Double
    @NSManaged public var userGender: String?
    @NSManaged public var userName: String?
    @NSManaged public var userImage: NSData?

}
