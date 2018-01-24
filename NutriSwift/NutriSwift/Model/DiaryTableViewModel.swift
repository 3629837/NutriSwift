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
            ["Apple", 50],
            ["Oats", "100"]
        ],
        [
            ["Chicken Breast", "150"],
            ["Spinach", "25"]
        ],
        [
            
        ],
        [
            ["Salted Cashew", "40"]
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
