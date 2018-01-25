//
//  ExploreTableViewController.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 25/01
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class exploreItemCell: UITableViewCell {
    @IBOutlet weak var exploreItemImg: UIImageView!
    @IBOutlet weak var exploreItemName: UILabel!
}


class ExploreTableViewController: UITableViewController {
    
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExploreModel.get.exploreItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exploreItemRow", for: indexPath) as! exploreItemCell
        let row = indexPath.row
        cell.imageView?.image = UIImage(named: ExploreModel.get.exploreItems[row].imgName)
        let exploreItemName = cell.viewWithTag(302) as! UILabel
        exploreItemName.text = ExploreModel.get.exploreItems[row].itemName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        ExploreModel.get.selectItemIndex = row
//        navigationController?.pushViewController(ExploreInfoController, animated: true)
    }
    

}
