//
//  FoodEntry.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/24/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class FoodEntry: Food {
    


    init(foodWeight: Float, mealTime: String) {
        self.foodWeight = foodWeight
        self.mealTime = mealTime
        super.init(foodName: String, vitaminA: Double, thiamin: Double, riboflavin: Double, niacin: Double, vitaminB6: Double) {
            self.foodName = foodName
            self.vitaminA = vitaminA
            self.thiamin = thiamin
            self.riboflavin = riboflavin
            self.niacin = niacin
            self.vitaminB6 = vitaminB6
        }
    }
}

