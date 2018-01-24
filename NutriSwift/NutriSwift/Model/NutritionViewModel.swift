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
    //Nutrient, RDI/AI (recommended), UL (upper level/limit)
    
    let nutritionRDI =
    [
            ["Vitamin A", "0.0009", "3000ug(i)"], // "A UL cannot be established for supplemental beta-carotene use and is not required for food use"
            ["Thiamin", "0.0012", "NP"], // Not possible to set - may be insufficient evidence or no clear level for adverse effects
            ["Riboflavin", "0.0013", "NP"], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
            ["Niacin(e)", "0.016", "35mg"], //"The UL for niacin refers to nicotinic acid. For supplemental nicotinamide, the UL is 900 mg/day for men and non-pregnant women, 150 mg/day for 1-3 yr-olds, 250 mg/day for 4-8 yr-olds; 500 mg/day for 9-13 yr-olds and 750 mg/day for 14-18 yr-olds. It is not possible to set a UL for nicotinamide for infancy (intake should be only breast milk, formula or foods) or pregnancy and lactation (source should be food only)"
            ["Vitamin B6(f)", "0.0013", "50mg"], //f For vitamin B6, the UL is set for pyridoxine
            ["Vitamin B12", "0.0024", "NP"],
            ["Folate(g)", "0.0004(h)", "1000UL"],   //g For folate, the UL is for intake from fortified foods and supplements as folic acid,
                                                    //h This is for dietary intake. For pregnant women, it does not include the additional supplemental folic acid required to prevent neural tube defects
            ["Pantothenic Acid", "0.006", "NP"], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
            ["Biotin", "0.00003", "NP"],
            ["Vitamin C", "0.045", "NP(j)"], //j Not possible to establish a UL for vitamin C from available data, but 1,000 mg/day would be a prudent limit
            ["Vitamin D", "0.000005", "80ug"],
            ["Vitamin E", "0.01", "0.3"],
            ["Vitamin K", "0.00007", "NP"], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
            ["Choline", "0.55", "3.5"],
            ["Vitamin E", "0.01", "0.3"],
            ["Choline", "0.55", "3.5"],
            ["Calcium", "1", "2.5"],
            
            ["Chromium", "35ug", "NP"], //Not possible to set - may be insufficient evidence or no clear level for adverse effects
            ["Copper", "1.7mg", "10mg"],
            ["Fluoride", "4mg", "10mg"],
            ["Iodine", "150ug", "1100ug"],
            ["Iron", "8mg", "45mg"],
            ["Magnesium", "400mg", "350mg(m)??"], //Note that all of the ULs listed for magnesium refer to supplements
            ["Manganese", "5.5,g", "NP(n)"], //Intake of manganese beyond that normally found in food and beverages could represent a health risk, but there are insufficient data to set a UL
            ["Molybdenum", "45ug", "2000ug"],
            ["Phosphorus", "1000mg", "4000mg"],
            ["Potassium", "3800mg", "NP(q)"], //"For potassium, supplements should only be taken under medical supervision"
            ["Selenium", "70ug", "400ug"],
            ["Sodium", "690mg", "ND(p)"], //460-920 range ND "Not Determined - reflecting the inability to identify a single point below which there is low risk."
            ["Zinc", "14mg", "40mg"],
    ]
    
}

