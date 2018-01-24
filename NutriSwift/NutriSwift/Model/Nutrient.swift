//
//  Nutrient.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/24/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class Nutrient {
    //per 100g (nutrition information)
    var nutrientName: String
    var RDI: Double
    var UL: Double
    var current: Double
    
    init(nutrientName: String, RDI: Double, UL: Double, current: Double) {
        self.nutrientName = nutrientName
        self.RDI = RDI
        self.UL = UL
        self.current = current
    }
}
