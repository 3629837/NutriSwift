//
//  foodNutritionModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 24/1/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class foodNutritionModel {
    //per 100g (nutrition information)
    
    var foodName: String
    var vitaminA: Float
    var thiamin: Float
    var riboflavin: Float
    var niacin: Float
    var vitaminB6: Float
    var vitaminB12: Float
    var folate: Float
    var pantothenicAcid: Float
    var biotin: Float
    var vitaminC : Float
    var vitaminD: Float
    var vitaminE: Float
    var vitaminK: Float
    var choline: Float
    var calcium: Float
    var chromium: Float
    var copper: Float
    var fluoride: Float
    var iodine: Float
    var iron: Float
    var magnesium: Float
    var manganese: Float
    var molybdenum: Float
    var phosphorus: Float
    var potassium: Float
    var selenium: Float
    var sodium: Float
    var zinc: Float
    
    init(   foodName: String, vitaminA: Float, thiamin: Float, riboflavin: Float, niacin: Float, vitaminB6: Float, vitaminB12: Float,
            folate: Float, pantothenicAcid: Float, biotin: Float, vitaminC : Float, vitaminD: Float, vitaminE: Float, vitaminK: Float,
            choline: Float, calcium: Float, chromium: Float, copper: Float, fluoride: Float, iodine: Float, iron: Float, magnesium: Float,
            manganese: Float, molybdenum: Float, phosphorus: Float, potassium: Float, selenium: Float, sodium: Float, zinc: Float) {
        self.foodName = foodName
        self.vitaminA = vitaminA
        self.thiamin = thiamin
        self.riboflavin = riboflavin
        self.niacin = niacin
        self.vitaminB6 = vitaminB6
        self.vitaminB12 = vitaminB12
        self.folate = folate
        self.pantothenicAcid = pantothenicAcid
        self.biotin = biotin
        self.vitaminC = vitaminC
        self.vitaminD = vitaminD
        self.vitaminE = vitaminE
        self.vitaminK = vitaminK
        self.choline = choline
        self.calcium = calcium
        self.chromium = chromium
        self.copper = copper
        self.fluoride = fluoride
        self.iodine = iodine
        self.iron = iron
        self.magnesium = magnesium
        self.manganese = manganese
        self.molybdenum = molybdenum
        self.phosphorus = phosphorus
        self.potassium = potassium
        self.selenium = selenium
        self.sodium = sodium
        self.zinc = zinc
    }
}
