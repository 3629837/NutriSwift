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
    var foodEntry = [
                        ["BreakfastFood1": 0, "BreakfastFood2": 0],
                        ["LunchFood1": 0],
                        ["DinnerFood1": 0],
                        ["SnackFood1": 0]
                    ]
}
