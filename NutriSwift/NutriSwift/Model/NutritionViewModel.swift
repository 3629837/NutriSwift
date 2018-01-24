//
//  NutritionViewModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/24/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class NutritionModel {
    static let get: NutritionModel = NutritionModel()
    private init() {
    }
    
    //fats macronutrients too complex, focus on microNutrients e.g minerals and vitamins
    // all amounts are in grams
    //RDI Male 19-30
    
    //[nutrientName, RDI/AI(recommendedIntake), UL(upper level/limit), currentIntake]
    
    var nutritionRDI =
    [
        ["Vitamin-A", 0.0009, 0.003, 0], // "A UL cannot be established for supplemental beta-carotene use and is not required for food use"
        ["Thiamin", 0.0012, "NP", 0], // Not possible to set - may be insufficient evidence or no clear level for adverse effects
        ["Riboflavin", 0.0013, "NP", 0], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
        ["Niacin", 0.016, 0.035, 0], //"The UL for niacin refers to nicotinic acid. For supplemental nicotinamide, the UL is 900 mg/day for men and non-pregnant women, 150 mg/day for 1-3 yr-olds, 250 mg/day for 4-8 yr-olds; 500 mg/day for 9-13 yr-olds and 750 mg/day for 14-18 yr-olds. It is not possible to set a UL for nicotinamide for infancy (intake should be only breast milk, formula or foods) or pregnancy and lactation (source should be food only)"
        ["Vitamin-B6", 0.0013, 0.05, 0], //f For vitamin B6, the UL is set for pyridoxine
        ["Vitamin-B12", 0.0000024, 0, "NP"],
        ["Folate", 0.0004, 0.001, 0],   //g For folate, the UL is for intake from fortified foods and supplements as folic acid,
                                                //h This is for dietary intake. For pregnant women, it does not include the additional supplemental folic acid required to prevent neural tube defects
        ["Pantothenic-Acid", 0.006, "NP", 0], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
//        ["Biotin", 0.00003, "NP", 0],
        ["Vitamin C", 0.045, "NP", 0], //j Not possible to establish a UL for vitamin C from available data, but 1,000 mg/day would be a prudent limit
        ["Vitamin D", 0.000005, 0.000080, 0],
        ["Vitamin E", 0.01, 0.3, 0],
        ["Vitamin K", 0.00007, "NP", 0], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
        ["Choline", 0.55, 3.5, 0],
        ["Calcium", 1, 2.5, 0],
//        ["Chromium", 0.000035, "NP", 0], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
        ["Copper", 0.0017, 0.01, 0],
        ["Fluoride", 0.0004, 0.001, 0],
//        ["Iodine", 0.00015, 0.00011, 0],
        ["Iron", 0.008, 0.045, 0],
        ["Magnesium", 0.4, 0.35, 0], //Note that all of the ULs listed for magnesium refer to supplements
        ["Manganese", 0.0055, "NP", 0], //Intake of manganese beyond that normally found in food and beverages could represent a health risk, but there are insufficient data to set a UL
//        ["Molybdenum", 0.000045, 0.002, 0],
        ["Phosphorus", 1, 4, 0],
        ["Potassium", 3.8, "NP", 0], //"For potassium, supplements should only be taken under medical supervision"
        ["Selenium", 0.00007, 0.0004, 0],
        ["Sodium", 0.69, "ND", 0], //460-920 range ND "Not Determined - reflecting the inability to identify a single point below which there is low risk."
        ["Zinc", 0.014, 0.04, 0]
    ]
    
    //    let apple = foodNutritionModel(foodName: "Apple", vitaminA: 0.000002, thiamin: 0.000019, riboflavin: 0.000028, niacin: 0.000091,  vitaminB6: 0.000037, vitaminB12: 0, folate: 0.000003, pantothenicAcid: 0, vitaminC : 0.0046, vitaminD: 0, vitaminE: 0.00018, vitaminK: 0.0000033, choline: 0, calcium: 0.006, copper: 0, fluoride: 0, iron: 0.00012, magnesium: 0.005, manganese: 0, phosphorus: 0.011, potassium: 0.107, selenium 0, sodium: 0.001, zinc: 0.00004)
    //biotin, chromium,iodine, molybdenum unavailable?
    
}

