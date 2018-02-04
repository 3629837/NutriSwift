//
//  FoodEntryViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/23/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class FoodEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var foodModel:FoodModel = FoodModel.sharedInstance
    var currentFood:CDFood?
    
    @IBOutlet var entryName: UITextField!
    @IBOutlet var entryWeight: UITextField!
    @IBOutlet weak var mealText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    static var foodDB: [[CDFood]] =
        [
            [
            ],
            [
            ],
            [
            ],
            [
            ]
    ]
    
    
    override func viewDidLoad() {
//        for meal in FoodModel.sharedInstance.foodDB1D{
//            for food in meal {
//                    FoodModel.sharedInstance.foodDB1D.removeAll()
//            }
//
//        }
        FoodModel.sharedInstance.getFoods()
        self.pickerView.isHidden = true
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return FoodModel.sharedInstance.sectionNames.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return FoodModel.sharedInstance.sectionNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.mealText.text = FoodModel.sharedInstance.sectionNames[row]
        FoodModel.sharedInstance.meal = FoodModel.sharedInstance.sectionNames[row]
        self.pickerView.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.mealText {
            self.pickerView.isHidden = false
            switch mealText.text! {
            case "Breakfast" :
                pickerView.selectRow(0, inComponent: 0, animated: true)
            case "Lunch":
                pickerView.selectRow(1, inComponent: 0, animated: true)
            case "Dinner":
                pickerView.selectRow(2, inComponent: 0, animated: true)
            case "Snacks":
                pickerView.selectRow(3, inComponent: 0, animated: true)
            default:
                print("")
            }
            //if you dont want the users to se the keyboard type:
            textField.endEditing(true)
        }
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        
        FoodModel.sharedInstance.name = entryName.text!
        
        let weight = Double(entryWeight.text!)
        
        confirmFood(title: "Confirm Food Entry", message: "Confirming food entry will add it to food diary", weight: weight)
        
        
    }
    
    func addFood(database: [CDFood])
    {
        FoodEntryViewController.foodDB = [[],[],[],[]]

        for food in FoodModel.sharedInstance.foodDB1D {
            switch food.mealType! {
            case "Breakfast":
                FoodEntryViewController.foodDB[0].append(food)
            case "Lunch":
                FoodEntryViewController.foodDB[1].append(food)
            case "Dinner":
                FoodEntryViewController.foodDB[2].append(food)
            case "Snacks":
                FoodEntryViewController.foodDB[3].append(food)
            default:
                print("failure")
            }
        }
        print("-------------")
        print("Adding Food")
        print (String(FoodEntryViewController.foodDB[0].count) + "brekky count")
        print (String(FoodEntryViewController.foodDB[1].count) + "lumch count")
        print (String(FoodEntryViewController.foodDB[2].count) + "dinner count")
        print (String(FoodEntryViewController.foodDB[3].count) + "snacks count")
        
    }
    
    
    func confirmFood (title: String, message: String, weight: Double?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
            FoodModel.sharedInstance.getFoods()
            
            FoodModel.sharedInstance.saveFood(FoodModel.sharedInstance.name, foodWeight: weight!, mealType: FoodModel.sharedInstance.meal, niacin: 0, riboflavin: 0, thiamin: 0, vitaminA: 0, vitaminB6: 0)
            
            FoodModel.sharedInstance.getFoods()
            
            self.addFood(database: FoodModel.sharedInstance.foodDB1D)
            
            FoodModel.sharedInstance.getFoods()
            
            
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}

