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
        //        super.viewWillAppear(animated)
        //        food.getFoods()
        tableView.reloadData()
    }
    
    //    var deletedObj: NSIndexPath
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //change this
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            FoodModel.sharedInstance.deleteFood(FoodModel.sharedInstance.foodDB[indexPath.row])
    //        let cell: FoodCell = tableView.dequeueReusableCell(withIdentifier: "diaryRow", for: indexPath) as! FoodCell
    //       self.tableView.deleteRows(at: [indexPath], with: .automatic)
    //
    ////            let section = indexPath.section
    ////            let row = indexPath.row
    ////            self.catNames.remove(at: indexPath.row)
    ////            self.tableView.deleteRows(at: [indexPath], with: .automatic)
    //
    //          //  DiaryModel.get.meals[section].remove(at: row)
    //         //   self.tableView.deleteRows(at: [indexPath], with: .automatic)
    ////            var count = 0
    ////            for food in FoodModel.sharedInstance.foodDB {
    ////                if food.mealType == FoodModel.sharedInstance.sectionNames[indexPath.section] && count < indexPath.row + 1
    ////                {
    //////                    cell.foodName.text = food.foodName!
    //////                    cell.foodWeight.text = String(food.foodWeight)
    ////                    FoodModel.sharedInstance.sectionNames[row].remove(at: row)
    ////                    FoodModel.sharedInstance.deleteFood(<#T##food: CDFood##CDFood#>)
    ////                    count += 1
    ////                }
    ////            }
    //
    //
    ////
    ////           food.deleteFood(food.foodDB[indexPath.row])
    ////            food.foodDB.remove(at: indexPath.row)
    ////            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    //        }
    //    }
    
    
    //    override func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool
    //    {
    //        return true
    //    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return FoodModel.sharedInstance.sectionNames.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection sectionIndex: Int) -> String? {
        
        return FoodModel.sharedInstance.sectionNames[sectionIndex]
        
    }
    
    @IBAction func AddMeal(_ sender: UIButton) {
        
        //        print("Going to FoodEntry")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        
        //  breakfast section
        if sectionIndex == 0
        {
            return FoodEntryViewController.foodDB[0].count
        }
            
            //lunch section
        else if sectionIndex == 1
        {
            return FoodEntryViewController.foodDB[1].count
        }
            
            //dinner section
        else if sectionIndex == 2
        {
            return FoodEntryViewController.foodDB[2].count
        }
            
            //snacks sections
        else {
            return FoodEntryViewController.foodDB[3].count
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FoodCell = tableView.dequeueReusableCell(withIdentifier: "diaryRow", for: indexPath) as! FoodCell
        
        let mealType = indexPath.section
        let food = indexPath.row
        
        cell.foodName.text = FoodEntryViewController.foodDB[mealType][food].foodName
        cell.foodWeight.text = String(FoodEntryViewController.foodDB[mealType][food].foodWeight)
        
        return cell
    }
    
}

