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
        let gymTips: ExploreItem = ExploreItem(itemName: "Gym Tips", imgName: "exploreItemGymTips", description: "While working out is a great way to unleash your primal side, you should still practice good manners and be respectful of your fellow gym goers. Knowing the unwritten rules of the land will not only make you feel more confident, but save you from getting the kind of look that might unnecessarily make the gym feel like an unfriendly place. Nobody may be judging how in shape you are.")
        let healthyFood: ExploreItem = ExploreItem(itemName: "Healthy Food", imgName: "exploreItemHealthyFood", description: "Whether you've got a sweet tooth for chocolate and red velvet anything or love salty treats like pretzels, know the foods that send you down the spiral of junk food binging. You've already accomplished half of the battle by identifying them. Keep them out of the house. Store healthy foods you want to eat more front and center in your fridge and out on your countertops. Snack foods are so easy to dig into—you just rip open a bag.")
        let detox: ExploreItem = ExploreItem(itemName: "Detox", imgName: "exploreItemDetox", description: "This refreshing and nutrient-packed smoothie is full of heart-healthy fiber and potassium, thanks to the pineapple and banana mixed in. Spinach brings essential nutrients such as vitamin K (which helps keep bones and tissues in top shape) and vitamin A (which helps maintain healthy skin). While this smoothie may seem high in carbs, Doerfler says not to let that scare you away — just rein in your intake for the rest of the day.")

        exploreItems.append(gymTips)
        exploreItems.append(healthyFood)
        exploreItems.append(detox)
    }
    
    
    var exploreItems: [ExploreItem] = [ExploreItem]()
    
    var selectItemIndex = -1
}
