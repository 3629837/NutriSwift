//
//  ProfileViewModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 1/25/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class ProfileModel {
    static let get: ProfileModel = ProfileModel()
    private init() {
    }
    var userProfile = Profile(userName: "Hayden", age: 22, gender: "Male")
}
