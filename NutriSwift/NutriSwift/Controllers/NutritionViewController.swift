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
        NutritionModel.get.updateNutrition(meals: DiaryModel.get.meals, nutritionRDI: NutritionModel.get.nutritionRDI)
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
    
//    @IBAction func AddMeal(_ sender: UIButton) {
//        print("Going to FoodEntry")
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return NutritionModel.get.nutritionRDI.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nutritionRow", for: indexPath)
        let row = indexPath.row
        let section = indexPath.section
        let intake = NutritionModel.get.nutritionRDI[row].current
        let rdi = NutritionModel.get.nutritionRDI[row].RDI
        let intakePercentage = round(100*(intake/rdi))

        
        //[nutrientName, RDI/AI(recommendedIntake), UL(upper level/limit), currentIntake]
        
        let nutrientName = cell.viewWithTag(201) as! UILabel
        nutrientName.text = NutritionModel.get.nutritionRDI[row].nutrientName
        let nutrientPercentage = cell.viewWithTag(202) as! UILabel
        nutrientPercentage.text = String(describing: intakePercentage) + "%"

        return cell
    }
}
