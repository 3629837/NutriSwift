//
//  ProfilePageController.swift
//  NutriSwift
//
//  Created by Hayden Farrier 25/01
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var userModel: UserModel = UserModel.sharedInstance
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    override func viewWillAppear(_ animated: Bool) {
        UserModel.sharedInstance.getUsers()
        if UserModel.sharedInstance.userDB.count > 1 {
            for user in UserModel.sharedInstance.userDB {
                UserModel.sharedInstance.deleteUser(user)
            }
        }
        if UserModel.sharedInstance.userDB.count > 0 {
            if UserModel.sharedInstance.userDB[0].userAge > 0 {
                let currentUser = UserModel.sharedInstance.userDB[0]
                userName.text = currentUser.userName
                age.text = String(Int(round(currentUser.userAge)))
                gender.text = currentUser.userGender
            }
        }
    }
    
    override func viewDidLoad() {
        self.genderPicker.isHidden = true
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UserModel.sharedInstance.genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return UserModel.sharedInstance.genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.gender.text = UserModel.sharedInstance.genders[row]
        self.genderPicker.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.gender {
            switch gender.text! {
                case "Male" :
                    genderPicker.selectRow(0, inComponent: 0, animated: true)
                case "Female":
                    genderPicker.selectRow(1, inComponent: 0, animated: true)
                case "Other":
                    genderPicker.selectRow(2, inComponent: 0, animated: true)
                default:
                    print("")
            }
            self.genderPicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    @IBAction func saveData(_ sender: Any) {
        let profileName = userName.text!
        let profileAge = Double(age.text!)!
        let profileGender = gender.text!

        if UserModel.sharedInstance.userDB.count > 0 {
            for user in UserModel.sharedInstance.userDB {
                UserModel.sharedInstance.deleteUser(user)
            }
        }
        UserModel.sharedInstance.saveUser(profileName, userAge: profileAge, userGender: profileGender)
        UserModel.sharedInstance.getUsers()

    }
    
    @IBAction func addImg(_ sender: Any) {
        pickMediaFromSource(UIImagePickerControllerSourceType.photoLibrary)
    }
    
    func pickMediaFromSource(_ sourceType:UIImagePickerControllerSourceType) {
        
        // What media types are available on the device
        let mediaTypes =
            UIImagePickerController.availableMediaTypes(for: sourceType)!
        if UIImagePickerController.isSourceTypeAvailable(sourceType)
            && mediaTypes.count > 0 {
            let picker = UIImagePickerController()
            // Display the media types avaialble on the picker
            picker.mediaTypes = mediaTypes
            
            // Set delegate to self for system method calls.
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            
            // Present the picker to the user.
            present(picker, animated: true, completion: nil)
        }
            // Otherwise display an error message
        else
        {
            let alertController = UIAlertController(title:"Error accessing media",
                                                    message: "Unsupported media source.",
                                                    preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK",
                                         style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
}

