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
        let gymTips: ExploreItem = ExploreItem(itemName: "Gym Tips", imgName: "exploreItemGymTips", description: "Reality check: No matter how much daydreaming you do, that alternate setting doesn't exist—unless your name is Jay, Ronnie, or Victor, that is. In this time and place, working out plays second fiddle to a number of obligations. And since your time is valuable, you can't waste one second on a bad workout. Hell, the good ones are tough enough to plan for. Strained reps, poor energy levels, incomplete sets, longer-than-desired workouts and shoddy results can leave you feeling like your time in the gym is all for naught. But there are things you can do before and after you head to the gym to ensure supercharged workouts today, tomorrow, and beyond—tips that can improve your efficiency, strength, even your time spent with the iron. Importantly, make sure you head in there well-rested.")
        let healthyFood: ExploreItem = ExploreItem(itemName: "Healthy Food", imgName: "exploreItemHealthyFood", description: "Reality check: No matter how much daydreaming you do, that alternate setting doesn't exist—unless your name is Jay, Ronnie, or Victor, that is. In this time and place, working out plays second fiddle to a number of obligations. And since your time is valuable, you can't waste one second on a bad workout. Hell, the good ones are tough enough to plan for. Strained reps, poor energy levels, incomplete sets, longer-than-desired workouts and shoddy results can leave you feeling like your time in the gym is all for naught. But there are things you can do before and after you head to the gym to ensure supercharged workouts today, tomorrow, and beyond—tips that can improve your efficiency, strength, even your time spent with the iron. If you're going to schedule your day around the gym, make sure you head in there well-rested.")
        let detox: ExploreItem = ExploreItem(itemName: "Detox", imgName: "exploreItemDetox", description: "Reality check: No matter how much daydreaming you do, that alternate setting doesn't exist—unless your name is Jay, Ronnie, or Victor, that is. In this time and place, working out plays second fiddle to a number of obligations. And since your time is valuable, you can't waste one second on a bad workout. Hell, the good ones are tough enough to plan for. Strained reps, poor energy levels, incomplete sets, longer-than-desired workouts and shoddy results can leave you feeling like your time in the gym is all for naught. But there are things you can do before and after you head to the gym to ensure supercharged workouts today, tomorrow, and beyond—tips that can improve your efficiency, strength, even your time spent with the iron. If you're going to schedule your day around the gym, make sure you head in there well-rested.")

        exploreItems.append(gymTips)
        exploreItems.append(healthyFood)
        exploreItems.append(detox)
    }
    
    
    var exploreItems: [ExploreItem] = [ExploreItem]()
    
    var selectItemIndex = -1
}
