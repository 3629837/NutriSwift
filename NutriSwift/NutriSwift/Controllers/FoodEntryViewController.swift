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
    

    
//    override func viewWillAppear(_ animated: Bool) {
////        self.pickerView.isHidden = true
//    }
    
    override func viewDidLoad() {
        
//        pickerView.delegate = self
//        pickerView.dataSource = self
//        pickerView.selectRow(0, inComponent: 0, animated: true)
//        meal = "Breakfast"
        self.pickerView.isHidden = true
        super.viewDidLoad()
        
        //        what does this actually do?
        //        if let _ = currentFood
        //        {
        //            entryName.text = currentFood!.entryName
        //            entryWeight.text = currentFood!.entryWeight
        //
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       // 1return DiaryModel.get.sectionNames.count

        return FoodModel.sharedInstance.sectionNames.count

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        //1return DiaryModel.get.sectionNames[row]
        return FoodModel.sharedInstance.sectionNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //1self.mealText.text = DiaryModel.get.sectionNames[row]
        //1meal = DiaryModel.get.sectionNames[row]
        self.mealText.text = FoodModel.sharedInstance.sectionNames[row]
        //meal = FoodModel.sharedInstance.sectionNames[row]
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
    
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
//        if textField == self.mealText {
//            self.pickerView.isHidden = true
//        }
//    }
    
    
    @IBAction func cancel(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
    
    @IBAction func save(_ sender: Any) {

        let name = entryName.text!
        let weight = Double(entryWeight.text!)
        let mealType = mealText.text!

        FoodModel.sharedInstance.saveFood(name, foodWeight: weight!, mealType: "Lunch", niacin: 0, riboflavin: 0, thiamin: 0, vitaminA: 0, vitaminB6: 0, existing: currentFood)
        FoodModel.sharedInstance.getFoods()
        
        //no items atm
        print("whats up " + (FoodModel.sharedInstance.foodDB[0].foodName)! + " hello")
        print("whats up " + (String)(FoodModel.sharedInstance.foodDB[0].foodWeight) + " 1st element weight")
//        print("whats up " + (String)(FoodModel.sharedInstance.foodDB[0].) + " 1st element weight")
//        print("whats up " + (FoodModel.sharedInstance.foodDB[1].foodName)! + " hello")
//        print("whats up " + (String)(FoodModel.sharedInstance.foodDB[1].foodWeight) + " 2nd element weight")
//        print("whats up " + (FoodModel.sharedInstance.foodDB[2].foodName)! + " hello")
//        print("whats up " + (String)(FoodModel.sharedInstance.foodDB[2].foodWeight) + " 3rd element weight")
//        print("whats up " + (FoodModel.sharedInstance.foodDB[3].foodName)! + " hello")
//         print("whats up " + (String)(FoodModel.sharedInstance.foodDB[3].foodWeight) + " 4th element weight")
//        print("whats up " + (FoodModel.sharedInstance.foodDB[4].foodName)! + " hello")
//         print("whats up " + (String)(FoodModel.sharedInstance.foodDB[4].foodWeight) + " 5th element weight")
//        print("whats up " + (FoodModel.sharedInstance.foodDB[5].foodName)! + " 5th element")
//         print("whats up " + (String)(FoodModel.sharedInstance.foodDB[5].foodWeight) + " 6th element weight")
//        print("whats up " + (FoodModel.sharedInstance.foodDB[6].foodName)! + " 6th element")
//         print("whats up " + (String)(FoodModel.sharedInstance.foodDB[6].foodWeight) + " 7th element weight")

//         print("dis is after deletion" + (FoodModel.sharedInstance.foodDB[0].foodName)! + " hello")
        
        //this deletes the whole food array
        for food in FoodModel.sharedInstance.foodDB {
//            FoodModel.sharedInstance.deleteFood(food)
        }
        
        
        let inputtedFood = DiaryModel.get.isValidFood(foods: DiaryModel.get.foods, input: name)
        let ourNewFood = Food(foodName: inputtedFood.foodName, vitaminA: inputtedFood.vitaminA, thiamin: inputtedFood.thiamin, riboflavin: inputtedFood.riboflavin, niacin: inputtedFood.niacin, vitaminB6: inputtedFood.vitaminB6)
        NutritionModel.get.updateNutrition(meals: DiaryModel.get.meals, nutritionRDI: NutritionModel.get.nutritionRDI)
//
//
        NutritionModel.get.updateNutrition(meals: DiaryModel.get.meals, nutritionRDI: NutritionModel.get.nutritionRDI)
        //DiaryModel.get.meals[0].append(inputtedFood)
        
        confirmFood(title: "Confirm Food Entry", message: "Confirming food entry will add it to food diary", ourNewFood: ourNewFood, mealArray: DiaryModel.get.meals, weight: weight)
        
    }
    
    func confirmFood (title: String, message: String, ourNewFood: Food, mealArray: [[Food]], weight: Double?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
          //  DiaryModel.get.meals = self.addFood(ourNewFood: ourNewFood, mealArray: mealArray, weight: weight)
          
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //change this
//    func addFood (ourNewFood: Food, mealArray: [[Food]], weight: Double?) -> [[Food]] {
//        var thisArray = mealArray
//
//        if ourNewFood.foodName != "False" {
//            switch meal {
//            case "Breakfast":
//                ourNewFood.mealType = "Breakfast"
//                ourNewFood.foodWeight = weight!
//                thisArray[0].append(ourNewFood)
//            case "Lunch":
//                ourNewFood.mealType = "Lunch"
//                ourNewFood.foodWeight = weight!
//                thisArray[1].append(ourNewFood)
//            case "Dinner":
//                ourNewFood.mealType = "Dinner"
//                ourNewFood.foodWeight = weight!
//                thisArray[2].append(ourNewFood)
//            case "Snacks":
//                ourNewFood.mealType = "Snacks"
//                ourNewFood.foodWeight = weight!
//                thisArray[3].append(ourNewFood)
//            default:
//                print("")
//            }
//        }
//
//        return thisArray
//    }
    
//    func detectSection () {
//
//        switch meal {
//        case "Breakfast":
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    
    
}

