//
//  DiaryTableViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/19/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class NutritionViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        UserModel.sharedInstance.getUsers()
        if UserModel.sharedInstance.userDB.count > 0 {
            NutritionModel.get.nutritionRDI = NutritionModel.get.getRDIGroup (user: UserModel.sharedInstance.userDB[0], m19RDI: NutritionModel.get.m19nutritionRDI, f19RDI: NutritionModel.get.f19nutritionRDI)
        }
        else {
            UserModel.sharedInstance.saveUser("", userAge: 0.0, userGender: "")
            UserModel.sharedInstance.getUsers()
            NutritionModel.get.nutritionRDI = NutritionModel.get.getRDIGroup (user: UserModel.sharedInstance.userDB[0], m19RDI: NutritionModel.get.m19nutritionRDI, f19RDI: NutritionModel.get.f19nutritionRDI)
        }
        NutritionModel.get.updateNutrition(meals: FoodModel.sharedInstance.foodDBSorted, nutritionRDI: NutritionModel.get.nutritionRDI)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection sectionIndex: Int) -> String? {
        return "Nutrition Breakdown"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return NutritionModel.get.nutritionRDI.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nutritionRow", for: indexPath)
        let row = indexPath.row
        let intake = NutritionModel.get.nutritionRDI[row].current
        let rdi = NutritionModel.get.nutritionRDI[row].RDI
        let intakePercentage = round(10*(100*(intake/rdi)))/10

        
        //[nutrientName, RDI/AI(recommendedIntake), UL(upper level/limit), currentIntake]
        
        let nutrientName = cell.viewWithTag(201) as! UILabel
        nutrientName.text = NutritionModel.get.nutritionRDI[row].nutrientName
        let nutrientPercentage = cell.viewWithTag(202) as! UILabel
        nutrientPercentage.text = String(describing: intakePercentage) + "%"

        return cell
    }
}

