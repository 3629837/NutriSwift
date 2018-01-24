//
//  FoodEntryViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/23/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class FoodEntryViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var entryName: UITextField!
    @IBOutlet var entryWeight: UITextField!

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var meal = ""
    
    override func viewDidLoad() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        meal = "Breakfast"
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DiaryModel.get.sectionNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DiaryModel.get.sectionNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        meal = DiaryModel.get.sectionNames[row]
    }
    
    @IBAction func printEntry(_ sender: Any) {
        let name = entryName.text!
        let weight = Double(entryWeight.text!)
        var inputtedFood = DiaryModel.get.isValidFood(foods: DiaryModel.get.foods, input: name)
        if inputtedFood.foodName != "False" {
            print("Valid Entry")
            switch meal {
                case "Breakfast":
                    inputtedFood.mealType = "Breakfast"
                    inputtedFood.foodWeight = weight!
                    DiaryModel.get.meals[0].append(inputtedFood)
                case "Lunch":
                    inputtedFood.mealType = "Lunch"
                    inputtedFood.foodWeight = weight!
                    DiaryModel.get.meals[1].append(inputtedFood)
                case "Dinner":
                    inputtedFood.mealType = "Dinner"
                    inputtedFood.foodWeight = weight!
                    DiaryModel.get.meals[2].append(inputtedFood)
                case "Snacks":
                    inputtedFood.mealType = "Snacks"
                    inputtedFood.foodWeight = weight!
                    DiaryModel.get.meals[3].append(inputtedFood)
                default:
                    print("failed")
            }
        }
        NutritionModel.get.updateNutrition(meals: DiaryModel.get.meals, nutritionRDI: NutritionModel.get.nutritionRDI)
    }
}

