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
        
        //male 19-30
        let m19vitaminA: Nutrient = Nutrient(nutrientName: "Vitamin-A", RDI: 0.0009, UL: 0.003, current: 0.0)
        let m19thiamin: Nutrient = Nutrient(nutrientName: "Thiamin", RDI: 0.0012, UL: -1.0, current: 0.0)
        let m19riboflavin: Nutrient = Nutrient(nutrientName: "Riboflavin", RDI: 0.0013, UL: -1.0, current: 0.0)
        let m19niacin: Nutrient = Nutrient(nutrientName: "Niacin", RDI: 0.016, UL: 0.035, current: 0.0)
        let m19vitaminB6: Nutrient = Nutrient(nutrientName: "Vitamin-B6", RDI: 0.0013, UL: 0.05, current: 0.0)
        
        //female 19-30
        let f19vitaminA: Nutrient = Nutrient(nutrientName: "Vitamin-A", RDI: 0.0009, UL: 0.003, current: 0.0)
        let f19thiamin: Nutrient = Nutrient(nutrientName: "Thiamin", RDI: 0.0012, UL: -1.0, current: 0.0)
        let f19riboflavin: Nutrient = Nutrient(nutrientName: "Riboflavin", RDI: 0.0013, UL: -1.0, current: 0.0)
        let f19niacin: Nutrient = Nutrient(nutrientName: "Niacin", RDI: 0.016, UL: 0.035, current: 0.0)
        let f19vitaminB6: Nutrient = Nutrient(nutrientName: "Vitamin-B6", RDI: 0.0013, UL: 0.05, current: 0.0)
        
        nutritionRDI.append(m19vitaminA)
        nutritionRDI.append(m19thiamin)
        nutritionRDI.append(m19riboflavin)
        nutritionRDI.append(m19niacin)
        nutritionRDI.append(m19vitaminB6)
   }
    
    //fats macronutrients too complex, focus on microNutrients e.g minerals and vitamins
    // all amounts are in grams
    //RDI Male 19-30
    
    //[nutrientName, RDI/AI(recommendedIntake), UL(upper level/limit), currentIntake]
    
    var nutritionRDI: [Nutrient] = [Nutrient]()
    
    func updateNutrition(meals: [[Food]], nutritionRDI: [Nutrient]) {
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
    }
    
//    func generateNutrientRequirements(profile: Profile) {
//
//    }
    
}

