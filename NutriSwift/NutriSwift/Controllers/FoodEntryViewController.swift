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
    
    //************ API ******************
    //NDB No for standard reference (e.g non branded) go from 01001 to 93600
    //Need (Vitamin A, RAE), Thiamin, Riboflavin, Niacin, Vitamin B-6
    
    var parsedJSON: Any = "This is initial value"
    var foodNDBNO: String = "This is initial value"
    var foodName: String = "This is initial value"
    var nutrientName: String = "This is initial value"
    var nutrientValue: Double = -1.0
    let nutrientsRequired = ["Vitamin A, RAE", "Thiamin", "Riboflavin", "Niacin", "Vitamin B-6"]
    var nutrientTupleArray: [(String, Double)] = []
    let session = URLSession.shared
    
    //*******************API*********************
    
    
    
    
    
    @IBOutlet var entryName: UITextField!
    @IBOutlet var entryWeight: UITextField!
    @IBOutlet weak var mealText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
        
    override func viewDidLoad() {
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
                print("Failure in selected meal")
            }
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
        FoodModel.sharedInstance.getFoods()
        let userInput = FoodModel.sharedInstance.name
        let escapedInput = userInput.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let apiUrl1 = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=" + escapedInput! + "&ds=Standard+Reference&sort=r&max=25&offset=0"
        
        updateParsedJSON(urlString: apiUrl1, completionHandler: { () in
            self.updateNDBNO(parsedJSON: self.parsedJSON)
            let apiUrl2 = "https://api.nal.usda.gov/ndb/reports/?ndbno=" + self.foodNDBNO + "&type=b&format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU"
            self.updateParsedJSON(urlString: apiUrl2, completionHandler: { () in
                for nutrient in self.nutrientsRequired {
                    self.updateNutrientInfo(parsedJSON: self.parsedJSON, targetNutrient: nutrient)
                }
                
                FoodModel.sharedInstance.saveFood(self.foodName, foodWeight: weight!, mealType: FoodModel.sharedInstance.meal, niacin: self.nutrientTupleArray[3].1, riboflavin: self.nutrientTupleArray[2].1, thiamin: self.nutrientTupleArray[1].1, vitaminA: self.nutrientTupleArray[0].1, vitaminB6: self.nutrientTupleArray[4].1)
                FoodModel.sharedInstance.getFoods()
                FoodModel.sharedInstance.populateFoodDB()
            })
        })

        self.navigationController!.popViewController(animated: true)
    }
    
    // ******************** API *********************** BELOW
    
    func updateParsedJSON (urlString: String, completionHandler: @escaping ()->(Void)) {
        //            let session = URLSession.shared
        let request = URLRequest(url: URL(string: urlString)!)
        
        let task = self.session.dataTask(with: request, completionHandler: {data, response, downloadError in
            if let error = downloadError {
                print("\(String(describing: data)) \n data")
                print("\(String(describing: response)) \n response")
                print("\(error)\n error")
            }
            else {
                let parsedResult: Any!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    self.parsedJSON = parsedResult
                    completionHandler();
                }
                catch let error as NSError {
                    parsedResult = nil
                }
                catch {
                    fatalError()
                }
            }
        })
        task.resume()
    }
    
    func updateNDBNO (parsedJSON: Any) {
        if let listDict = (parsedJSON as AnyObject).value(forKey: "list") as? NSDictionary {
            let itemArray = listDict.value(forKey: "item") as! NSArray
            let firstItemDict: NSDictionary = itemArray[0] as! NSDictionary
            self.foodName = firstItemDict.value(forKey: "name") as! String
            self.foodNDBNO = firstItemDict.value(forKey: "ndbno") as! String
        }
    }
    
    func updateNutrientInfo (parsedJSON: Any, targetNutrient: String) {
        if let reportDict = (parsedJSON as AnyObject).value(forKey: "report") as? NSDictionary {
            let foodDict = reportDict.value(forKey: "food") as! NSDictionary
            let nutrientsArray = foodDict.value(forKey: "nutrients") as! NSArray
            var nutrientCounter = 0
            while nutrientCounter < nutrientsArray.count {
                let thisNutrientDict = nutrientsArray[nutrientCounter] as! NSDictionary
                if thisNutrientDict.value(forKey: "name") as! String == targetNutrient {
                    break
                }
                nutrientCounter += 1
            }
            
            let firstNutrientDict = nutrientsArray[nutrientCounter] as! NSDictionary
            
            let nutrientName = firstNutrientDict.value(forKey: "name") as! String
            let strValue = firstNutrientDict.value(forKey: "value") as! String
            let unformattedValue = Double(strValue)!
            let unit = firstNutrientDict.value(forKey: "unit") as! String
            var formattedValue: Double = -1.0
            if unit == "µg" {
                formattedValue = unformattedValue/1000000
            }
                
            else if unit == "mg" {
                formattedValue = unformattedValue/1000
            }
                
            else {
                formattedValue = unformattedValue
            }
            
            let nutrientTuple = (nutrientName, formattedValue)
            self.nutrientTupleArray.append(nutrientTuple)
        }
    }
    
}

