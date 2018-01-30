//
//  Profile+CoreDataProperties.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/30/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var profileName: String?
    @NSManaged public var profileAge: Int16
    @NSManaged public var profileGender: String?

}
