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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let section = indexPath.section
            let row = indexPath.row
            DiaryModel.get.meals[section].remove(at: row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//
//           food.deleteFood(food.foodDB[indexPath.row])
//            food.foodDB.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //1return DiaryModel.get.sectionNames.count
        return FoodModel.sharedInstance.sectionNames.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection sectionIndex: Int) -> String? {
        //1return DiaryModel.get.sectionNames[sectionIndex]
        return FoodModel.sharedInstance.sectionNames[sectionIndex]
        //        return food.foodDB.count
    }
    
    @IBAction func AddMeal(_ sender: UIButton) {
//        print("Going to FoodEntry")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return DiaryModel.get.meals[sectionIndex].count
//        return food.foodDB.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diaryRow", for: indexPath)
        let row = indexPath.row
        let sectionIndex = indexPath.section

        //labels access the foodEntry array to get the foodName: weight(g) dict entries for each section/row
        let foodName = cell.viewWithTag(101) as! UILabel
        foodName.text = DiaryModel.get.meals[sectionIndex][row].foodName
        // foodName.text = food.getFoods(indexPath)
        let foodWeight = cell.viewWithTag(102) as! UILabel
        let weight = round(10*DiaryModel.get.meals[sectionIndex][row].foodWeight)/10
        foodWeight.text = String(describing: weight) + "g"
        return cell
    }

}
