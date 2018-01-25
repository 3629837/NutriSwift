//
//  ExploreInfoController.swift
//  NutriSwift
//
// 
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class ExploreInfoViewController: UIViewController {
    
    @IBOutlet weak var exploreTitle: UILabel!
    @IBOutlet weak var exploreDesc: UILabel!
    @IBOutlet weak var exploreImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreImage.image = UIImage(named: ExploreModel.get.exploreItems[ExploreModel.get.selectItemIndex].imgName)!
        exploreTitle.text = ExploreModel.get.exploreItems[ExploreModel.get.selectItemIndex].itemName
        exploreDesc.text = ExploreModel.get.exploreItems[ExploreModel.get.selectItemIndex].description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
