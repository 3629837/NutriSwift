//
//  FoodCell.swift
//  NutriSwift
//
//  Created by Asli Yoruk on 2/2/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodWeight: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
