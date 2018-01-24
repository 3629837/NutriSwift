//
//  ExploreTableViewController.swift
//  NutriSwift
//
//  Created by Asli Yoruk on 1/24/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation
import UIKit

class ExploreTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sectionNames = ["Gym Tips", "Healthy Food", "Detox", "Home Exercises"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id.cell.explore")
        cell!.textLabel?.text = sectionNames[indexPath.row];
        cell!.textLabel?.textAlignment = .center
        return cell!
    }
    

}
