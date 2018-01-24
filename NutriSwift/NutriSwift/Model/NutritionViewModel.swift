//
//  NutritionViewModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/24/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class NutritionModel {
    static let get: NutritionModel = NutritionModel()
    private init() {
        var vitaminA: Nutrient = Nutrient(nutrientName: "Vitamin-A", RDI: 0.0009, UL: 0.003, current: 0.0)
        var thiamin: Nutrient = Nutrient(nutrientName: "Thiamin", RDI: 0.0012, UL: -1.0, current: 0.0)
        var riboflavin: Nutrient = Nutrient(nutrientName: "Riboflavin", RDI: 0.0013, UL: -1.0, current: 0.0)
        var niacin: Nutrient = Nutrient(nutrientName: "Niacin", RDI: 0.016, UL: 0.035, current: 0.0)
        var vitaminB6: Nutrient = Nutrient(nutrientName: "Vitamin-B6", RDI: 0.0013, UL: 0.05, current: 0.0)
        nutritionRDI.append(vitaminA)
        nutritionRDI.append(thiamin)
        nutritionRDI.append(riboflavin)
        nutritionRDI.append(niacin)
        nutritionRDI.append(vitaminB6)
   }
    
    //fats macronutrients too complex, focus on microNutrients e.g minerals and vitamins
    // all amounts are in grams
    //RDI Male 19-30
    
    //[nutrientName, RDI/AI(recommendedIntake), UL(upper level/limit), currentIntake]
    
    var nutritionRDI: [Nutrient] = [Nutrient]()
    
    func updateNutrition(meals: [[Food]], nutritionRDI: [Nutrient]) -> Int {
//        var vitaminA = nutritionRDI[0].current
//        var thiamin = nutritionRDI[1].current
//        var riboflavin = nutritionRDI[2].current
//        var niacin = nutritionRDI[3].current
//        var vitaminB6 = nutritionRDI[4].current
        nutritionRDI[0].current = 0.0
        nutritionRDI[1].current = 0.0
        nutritionRDI[2].current = 0.0
        nutritionRDI[3].current = 0.0
        nutritionRDI[4].current = 0.0
        
        for mealType in meals {
            for food in mealType {
                nutritionRDI[0].current += food.vitaminA * food.foodWeight/100
                nutritionRDI[1].current += food.thiamin * food.foodWeight/100
                nutritionRDI[2].current += food.riboflavin * food.foodWeight/100
                nutritionRDI[3].current += food.niacin * food.foodWeight/100
                nutritionRDI[4].current += food.vitaminB6 * food.foodWeight/100
            }
        }
        
        return 1
    }
    
//    var nutritionRDI =
//    [
//        ("Vitamin-A", 0.0009, 0.003, 0.0), // "A UL cannot be established for supplemental beta-carotene use and is not required for food use"
//        ("Thiamin", 0.0012, -1.0, 0.0), // Not possible to set - may be insufficient evidence or no clear level for adverse effects
//        ("Riboflavin", 0.0013, -1.0, 0.0), //Not possible to set - may be insufficient evidence or no clear level for adverse effects
//        ("Niacin", 0.016, 0.035, 0.0), //"The UL for niacin refers to nicotinic acid. For supplemental nicotinamide, the UL is 900 mg/day for men and non-pregnant women, 150 mg/day for 1-3 yr-olds, 250 mg/day for 4-8 yr-olds; 500 mg/day for 9-13 yr-olds and 750 mg/day for 14-18 yr-olds. It is not possible to set a UL for nicotinamide for infancy (intake should be only breast milk, formula or foods) or pregnancy and lactation (source should be food only)"
//        ("Vitamin-B6", 0.0013, 0.05, 0.0) //f For vitamin B6, the UL is set for pyridoxine
//    ]
    
    
    
}

