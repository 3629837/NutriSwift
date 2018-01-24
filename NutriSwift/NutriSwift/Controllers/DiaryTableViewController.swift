//
//  DiaryTableViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/19/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return DiaryModel.get.sectionNames.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection sectionIndex: Int) -> String? {
        return DiaryModel.get.sectionNames[sectionIndex]
    }
    
    @IBAction func AddMeal(_ sender: UIButton) {
        print("Going to FoodEntry")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return DiaryModel.get.foodEntry[sectionIndex].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let row = indexPath.row
        let section = indexPath.section

        //labels access the foodEntry array to get the foodName: weight(g) dict entries for each section/row
        let foodName = cell.viewWithTag(1) as! UILabel
        foodName.text = DiaryModel.get.foodEntry[section][row][0]
        let foodWeight = cell.viewWithTag(2) as! UILabel
        foodWeight.text = DiaryModel.get.foodEntry[section][row][1] + "g"
        return cell
    }
}
