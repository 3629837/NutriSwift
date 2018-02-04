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
    
        override func viewDidLoad() {
            
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
            
        }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    
    

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {

                let section = indexPath.section
                let row = indexPath.row
                
                let selectedFood = FoodEntryViewController.foodDB[section][row]
                
               
                
                for foodCD in FoodModel.sharedInstance.foodDB1D {
                    if selectedFood == foodCD {
//                         tableView.beginUpdates()
                        FoodModel.sharedInstance.deleteFood(FoodModel.sharedInstance.foodDB1D[row])
                        FoodModel.sharedInstance.foodDB1D.remove(at: indexPath.row)
//                        print("before deleting foodDB")
//                                print (String(FoodEntryViewController.foodDB[0].count) + "brekky count")
//                                print (String(FoodEntryViewController.foodDB[1].count) + "lumch count")
//                                print (String(FoodEntryViewController.foodDB[2].count) + "dinner count")
//                                print (String(FoodEntryViewController.foodDB[3].count) + "snacks count")

//                         tableView.endUpdates()
                    }
                }
//                tableView.beginUpdates()
                FoodEntryViewController.foodDB[section].remove(at: row)
                print("------------------------")
                print("after deleting foodDB")
                print (String(FoodEntryViewController.foodDB[0].count) + "brekky count")
                print (String(FoodEntryViewController.foodDB[1].count) + "lumch count")
                print (String(FoodEntryViewController.foodDB[2].count) + "dinner count")
                print (String(FoodEntryViewController.foodDB[3].count) + "snacks count")
//                FoodModel.sharedInstance.deleteFood(FoodEntryViewController.foodDB[section].remove(at: row))
//                tableView.reloadData()
//                tableView.endUpdates()
                
//                tableView.beginUpdates()
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
//                tableView.endUpdates()
                
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

