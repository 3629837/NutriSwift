//
//  ProfilePageController.swift
//  NutriSwift
//
//  Created by Hayden Farrier 25/01
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    var userModel: UserModel = UserModel.sharedInstance
    var currentUser: User?
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        userName.text = ProfileModel.get.userProfile.userName
        age.text = String(ProfileModel.get.userProfile.age)
        gender.text = ProfileModel.get.userProfile.gender
    }
    
    override func viewDidLoad() {
//        let profileName = userName.text!
//        let profileAge = Double(age.text!)
//        let profileGender = userName.text!
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveData(_ sender: Any) {
//        let profileName = userName.text!
//        let profileAge = Int(age.text!)
//        let profileGender = gender.text!
//        ProfileModel.get.userProfile.userName = profileName
//        ProfileModel.get.userProfile.age = profileAge!
//        ProfileModel.get.userProfile.gender = profileGender
        UserModel.sharedInstance.saveUser("Hayden", userAge: 22, userGender: "Male", existing: currentUser)
        UserModel.sharedInstance.getUsers()
        print(UserModel.sharedInstance.userDB.count)
        for user in UserModel.sharedInstance.userDB {
            print(user.userName)
        }
    }
}

