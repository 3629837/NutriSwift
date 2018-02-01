//
//  DiaryTableViewModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/22/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class DiaryModel {
    static let get: DiaryModel = DiaryModel()
    private init() {
        
        let apple: Food = Food(foodName: "Apple", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037)
        let banana: Food = Food(foodName: "Banana", vitaminA: 0.000003, thiamin: 0.000031, riboflavin: 0.000073, niacin: 0.000665,  vitaminB6: 0.000367)
        let carrot: Food = Food(foodName: "Carrot", vitaminA: 0.000835, thiamin: 0.000066, riboflavin: 0.000058, niacin: 0.000983,  vitaminB6: 0.000138)
        let brocolli: Food = Food(foodName: "Brocolli", vitaminA: 0.000031, thiamin: 0.000071, riboflavin: 0.000117, niacin: 0.000639,  vitaminB6: 0.000175)
        
//        let entry1: Food = Food(foodName: "Apple", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037,
//                                foodWeight: 50, mealType: "Breakfast")
//        let entry2: Food = Food(foodName: "Apple", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037,
//                                foodWeight: 100, mealType: "Lunch")
        foods.append(apple)
        foods.append(banana)
        foods.append(carrot)
        foods.append(brocolli)
    }
    
    var foods: [Food] = [Food]()

    var meals: [[Food]] =
    [
        [
        ],
        [
        ],
        [
        ],
        [
        ]
    ]
   // var sectionNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    
    func isValidFood(foods: [Food], input: String) -> Food {
        let falseFood: Food = Food(foodName: "False", vitaminA: -1.0, thiamin: -1.0, riboflavin: -1.0, niacin: -1.0, vitaminB6: -1.0)
        for food in foods {
            if (food.foodName == input) {
                return food
            }
        }
        return falseFood
    }

}
