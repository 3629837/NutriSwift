//
//  ExploreItem.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/25/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.

import Foundation
import UIKit

class ExploreItem {
    var itemName: String
    var description: String
    var imgName: String
    
    init(itemName: String, imgName: String, description: String) {
        self.itemName = itemName
        self.description = description
        self.imgName = imgName
    }
}


