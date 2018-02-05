//
//  DiaryTableViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/19/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var food:FoodModel = FoodModel.sharedInstance
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        FoodModel.sharedInstance.getFoods()
    }

    override func viewDidLoad() {
        FoodModel.sharedInstance.getFoods()
        tableView.reloadData()
        super.viewDidLoad()
        
        FoodModel.sharedInstance.populateFoodDB()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            let section = indexPath.section
            let row = indexPath.row
            
            let selectedFood = FoodModel.sharedInstance.foodDBSorted[section][row]
            
            for foodCD in FoodModel.sharedInstance.foodDBUnsorted {
                if selectedFood == foodCD {
                    FoodModel.sharedInstance.deleteFood(selectedFood)
                }
            }

            FoodModel.sharedInstance.foodDBSorted[section].remove(at: row)

            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            
        }
    }


    override func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return FoodModel.sharedInstance.sectionNames.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection sectionIndex: Int) -> String? {
    
        return FoodModel.sharedInstance.sectionNames[sectionIndex]
    }

    @IBAction func AddMeal(_ sender: UIButton) {
    
    //        ("Going to FoodEntry")
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
    
        if sectionIndex == 0
        {
            return FoodModel.sharedInstance.foodDBSorted[0].count
        }
            
        else if sectionIndex == 1
        {
            return FoodModel.sharedInstance.foodDBSorted[1].count
        }
            
        else if sectionIndex == 2
        {
            return FoodModel.sharedInstance.foodDBSorted[2].count
        }
  
        else {
            return FoodModel.sharedInstance.foodDBSorted[3].count
        }
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FoodCell = tableView.dequeueReusableCell(withIdentifier: "diaryRow", for: indexPath) as! FoodCell
        
        let mealType = indexPath.section
        let food = indexPath.row
        let foodName = FoodModel.sharedInstance.foodDBSorted[mealType][food].foodName!
        let strFoodWeight = String(FoodModel.sharedInstance.foodDBSorted[mealType][food].foodWeight)
        var formattedName = ""
        
        if foodName.count > 32 {
            formattedName = foodName.prefix(30) + "..."
            cell.foodName.text = formattedName
        }
        else {
             cell.foodName.text = foodName
        }
        cell.foodWeight.text = strFoodWeight
        
        return cell
    }
    
    @IBAction func clearAll(_ sender: Any) {
        FoodModel.sharedInstance.getFoods()
        for food in FoodModel.sharedInstance.foodDBUnsorted {
            FoodModel.sharedInstance.deleteFood(food)
        }
        
        FoodModel.sharedInstance.getFoods()
        FoodModel.sharedInstance.populateFoodDB()
        tableView.reloadData()
        FoodModel.sharedInstance.getFoods()
    }
    
}

