//
//  FoodEntryViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/23/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class FoodEntryViewController: UIViewController {
    

    
    @IBOutlet var entryMeal: UITextField!
    @IBOutlet var entryName: UITextField!
    @IBOutlet var entryWeight: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func printEntry(_ sender: Any) {
        let meal = entryMeal.text!
        let name = entryName.text!
        let weight = entryWeight.text!
//        if let weight = Int(weight) {
//            var rawData = (meal, name, weight)
//            DiaryModel.get.rawEntry.append(rawData)
//            DiaryModel.get.readRawData(rawData: DiaryModel.get.rawEntry)
//        }
        var rawData = (meal, name, weight)
        DiaryModel.get.rawEntry.append(rawData)
        DiaryModel.get.readRawData(rawData: DiaryModel.get.rawEntry)
//        else {
//            print("not working")
//        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

