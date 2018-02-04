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
        let gymTips: ExploreItem = ExploreItem(itemName: "Gym Tips", imgName: "exploreItemGymTips", description:
            "Reality check: No matter how much daydreaming you do, that alternate setting doesn't exist—unless your name is Jay, Ronnie, or Victor, that is. In this time and place, working out plays second fiddle to a number of obligations. And since your time is valuable, you can't waste one second on a bad workout. Hell, the good ones are tough enough to plan for. Strained reps, poor energy levels, incomplete sets, longer-than-desired workouts and shoddy results can leave you feeling like your time in the gym is all for naught. But there are things you can do before and after you head to the gym to ensure supercharged workouts today, tomorrow, and beyond—tips that can improve your efficiency, strength, even your time spent with the iron. Importantly, make sure you head in there well-rested.")
        let healthyFood: ExploreItem = ExploreItem(itemName: "Healthy Food", imgName: "exploreItemHealthyFood", description:
            "The key to a healthy diet is to: Eat the right amount of calories for how active you are, so that you balance the energy you consume with the energy you use. If you eat or drink too much, you'll put on weight. If you eat and drink too little, you'll lose weight. Eat a wide range of foods to ensure that you're getting a balanced diet and that your body is receiving all the nutrients it needs. It is recommended that men have around 2,500 calories a day (10,500 kilojoules). Women should have around 2,000 calories a day (8,400 kilojoules). Most adults are eating more calories than they need, and should eat fewer calories. Starchy carbohydrates should make up just over one third of the food you eat. They include potatoes, bread, rice, pasta and cereals.")
        let detox: ExploreItem = ExploreItem(itemName: "Detox", imgName: "exploreItemDetox", description:
            "Lately it seems as though everyone is doing a juice cleanse, experimenting with fasting, or living off raw food. If you're like me, and have a history of disordered eating, battles with countless diets, or struggles with body image, a typical “detox” may do more harm than good. This doesn’t mean that you can’t reap all the positive benefits of detoxing your body, mind, and spirit. Here are my top eight tips to detox, free of fasting, juicing or restricting. Consume whole foods as close to their natural state as possible. Detoxifying the body doesn't have to mean a crazy restrictive diet. By choosing whole foods, your body will be able to digest and metabolize them with ease, leaving more time for natural detoxifying to take place. Think fresh fruits and vegetables.")

        exploreItems.append(gymTips)
        exploreItems.append(healthyFood)
        exploreItems.append(detox)
    }
    
    
    var exploreItems: [ExploreItem] = [ExploreItem]()
    
    var selectItemIndex = -1
}
