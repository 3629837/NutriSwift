//
//  Profile.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/25/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class Profile {
    //per 100g (nutrition information)
    var userName: String
    var age: Int
    var gender: String
    
    init(userName: String, age: Int, gender: String) {
        self.userName = userName
        self.age = age
        self.gender = gender
    }
}

