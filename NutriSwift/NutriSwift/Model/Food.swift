//
//  foodNutritionModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 24/1/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class Food {
    //per 100g (nutrition information)
    var foodName: String
    var vitaminA: Double
    var thiamin: Double
    var riboflavin: Double
    var niacin: Double
    var vitaminB6: Double
    var foodWeight: Double
    var mealType: String
    

    init(foodName: String, vitaminA: Double, thiamin: Double, riboflavin: Double, niacin: Double, vitaminB6: Double, foodWeight: Double = -1.0, mealType: String = "None") {
        self.foodName = foodName
        self.vitaminA = vitaminA
        self.thiamin = thiamin
        self.riboflavin = riboflavin
        self.niacin = niacin
        self.vitaminB6 = vitaminB6
        self.foodWeight = foodWeight
        self.mealType = mealType
    }
}
