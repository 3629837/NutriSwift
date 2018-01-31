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
    var this = UserModel.sharedInstance.saveUser("", userAge: -1.0, userGender: "")
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        UserModel.sharedInstance.getUsers()
        var currentUser = UserModel.sharedInstance.userDB[0]
        if currentUser.userName != "" {
            userName.text = currentUser.userName
            age.text = String(currentUser.userAge)
            gender.text = currentUser.userGender
        }
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
        let profileName = userName.text!
        let profileAge = Double(age.text!)!
        let profileGender = gender.text!
//        ProfileModel.get.userProfile.userName = profileName
//        ProfileModel.get.userProfile.age = profileAge!
//        ProfileModel.get.userProfile.gender = profileGender
        UserModel.sharedInstance.deleteUser(UserModel.sharedInstance.userDB[0])
        UserModel.sharedInstance.saveUser(profileName, userAge: profileAge, userGender: profileGender)
        UserModel.sharedInstance.getUsers()
        print(UserModel.sharedInstance.userDB.count)
        print(UserModel.sharedInstance.userDB[0].userName)
//        for user in UserModel.sharedInstance.userDB {
//            print(user.userName)
//            UserModel.sharedInstance.deleteUser(user)
//
//        }
    }
}

