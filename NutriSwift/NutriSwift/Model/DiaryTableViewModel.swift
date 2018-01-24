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
        let banana: Food = Food(foodName: "Banana", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037)
        
//        let entry1: Food = Food(foodName: "Apple", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037,
//                                foodWeight: 50, mealType: "Breakfast")
//        let entry2: Food = Food(foodName: "Apple", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037,
//                                foodWeight: 100, mealType: "Lunch")
        foods.append(apple)
        foods.append(banana)
//        meals[0].append(entry1)
//        meals[1].append(entry2)
//        meals[2].append(dinner)
//        meals[3].append(snacks)
    }
    
    var foods: [Food] = [Food]()
//    var breakfast: [Food] = [Food]()
//    var lunch: [Food] = [Food]()
//    var dinner: [Food] = [Food]()
//    var snacks: [Food] = [Food]()
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
    var sectionNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]
    
    func isValidFood(foods: [Food], input: String) -> Food {
        let falseFood: Food = Food(foodName: "False", vitaminA: -1.0, thiamin: -1.0, riboflavin: -1.0, niacin: -1.0, vitaminB6: -1.0)
        for food in foods {
            if (food.foodName == input) {
                return food
            }
        }
        return falseFood
    }
    
    
    
    
//    func readRawData(rawData: [(String, String, String)]) -> Int {
//        for tuple in rawData {
//            let meal:String = tuple.0
//            let name:String = tuple.1
//            let weight:Double = Double(tuple.2)!
//            print(meal)
//            switch meal {
//            case "Breakfast":
//                foodEntry[0].append((name, weight))
//            case "Lunch":
//                foodEntry[1].append((name, weight))
//            case "Dinner":
//                foodEntry[2].append((name, weight))
//            case "Snacks":
//                foodEntry[3].append((name, weight))
//            default:
//                print("Did not fit into meal sections")
//            }
//        }
//        return 1
//    }
}
