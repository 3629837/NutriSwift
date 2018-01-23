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
    }
    
    var sectionNames = ["Breakfast", "Lunch", "Dinner", "Snacks"]

    var rawEntry = [(String, String, String)]()
    
    var foodEntry =
    [
        [
            ["BreakfastFood1", "0"], ["BreakfastFood2", "0"]
        ],
        [
            ["LunchFood1", "0"]
        ],
        [
            ["DinnerFood1", "0"]
        ],
        [
            ["SnackFood1", "0"]
        ]
    ]
    func readRawData(rawData: [(String, String, String)]) -> Int {
        for tuple in rawData {
            let meal:String = tuple.0
            let name:String = tuple.1
            let weight:String = tuple.2
            print(meal)
            switch meal {
            case "Breakfast":
                foodEntry[0].append([name, weight])
                for array in foodEntry[0] {
                    print(array[0])
                }
            case "Lunch":
                foodEntry[1].append([name, weight])
            case "Dinner":
                foodEntry[2].append([name, weight])
            case "Snacks":
                foodEntry[3].append([name, weight])
            default:
                print("Did not fit into meal sections")
            }
        }
        return 1
    }
}
