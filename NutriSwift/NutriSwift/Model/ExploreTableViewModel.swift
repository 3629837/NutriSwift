//
//  ExploreTableViewModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/25/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class ExploreModel {
    static let get: ExploreModel = ExploreModel()
    private init() {
        let gymTips: ExploreItem = ExploreItem(itemName: "Gym Tips", imgName: "exploreItemGymTips", description: "This is gym tips description")
        let healthyFood: ExploreItem = ExploreItem(itemName: "Healthy Food", imgName: "exploreItemHealthyFood", description: "This is healthy food description")
        let detox: ExploreItem = ExploreItem(itemName: "Detox", imgName: "exploreItemDetox", description: "This is detox description")

        exploreItems.append(gymTips)
        exploreItems.append(healthyFood)
        exploreItems.append(detox)
    }
    
    
    var exploreItems: [ExploreItem] = [ExploreItem]()
    
    var selectItemIndex = -1
//    var selectedItem: [ExploreItem]? = nil
    
//    func updateNutrition(meals: [[Food]], nutritionRDI: [Nutrient]) {
//        nutritionRDI[0].current = 0.0
//        nutritionRDI[1].current = 0.0
//        nutritionRDI[2].current = 0.0
//        nutritionRDI[3].current = 0.0
//        nutritionRDI[4].current = 0.0
//
//        for mealType in meals {
//            for food in mealType {
//                nutritionRDI[0].current += food.vitaminA * food.foodWeight/100
//                nutritionRDI[1].current += food.thiamin * food.foodWeight/100
//                nutritionRDI[2].current += food.riboflavin * food.foodWeight/100
//                nutritionRDI[3].current += food.niacin * food.foodWeight/100
//                nutritionRDI[4].current += food.vitaminB6 * food.foodWeight/100
//            }
//        }
}
