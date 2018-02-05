//
//  ProfilePageController.swift
//  NutriSwift
//
//  Created by Hayden Farrier 25/01
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices
import CoreData

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var userModel: UserModel = UserModel.sharedInstance
    
    
    // CAMERA FUNCTIONALITY
    var avPlayerViewController: AVPlayerViewController!
    var managedContext : NSManagedObjectContext?
    // ******
    
    //*******OBSERVER********
    // Set the initial value on the model to an empty string
    // set init method in the Observable struct.
    var observedText = Observable<String>(value: (""))
    @IBOutlet weak var outputLabel: UILabel!
    //*******OBSERVER********
    
    var image: UIImage?
    var lastChosenMediaType: String?
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
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
        super.viewDidLoad()
        self.genderPicker.isHidden = true
        
        //*******OBSERVER********
        observedText.observe { (value: String) -> () in
            if let inputAge = Int(value) {
            
                if inputAge >= 19 && inputAge <= 29 {
                    self.outputLabel.text = "RDI age group: 19 - 29"
                }
                
                else {
                    self.outputLabel.text = "RDI not available for your age group"
                }
            
            }
            else {
                self.outputLabel.text = "Error, please input an integer"
            }
        }
        
        age.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        //*******OBSERVER********
    }
    
    //*******OBSERVER********
    @objc func textDidChange() {
        observedText.value = (age.text!)
    }
    //*******OBSERVER********
    
    
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
                    print("Gender picker failure")
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
    
    //****************** CAMERA FUNCTIONALITY ***************************
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    @IBAction func addImageFromLibrary(_ sender: UIButton) {
        pickMediaFromSource(UIImagePickerControllerSourceType.photoLibrary)
    }
    
    @IBAction func addImageFromCamera(_ sender: UIButton) {
        if !UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.camera) {
            
            let alert = UIAlertController(title: "Error", message: "Unable to detect camera", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                }
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else {
            pickMediaFromSource(UIImagePickerControllerSourceType.camera)
        }
    }
    
    func updateDisplay() {
        if let mediaType = lastChosenMediaType {
            if mediaType == (kUTTypeImage as NSString) as String {
                imageView.image = image!
                imageView.isHidden = false
            }
        }
    }
    
    func pickMediaFromSource(_ sourceType:UIImagePickerControllerSourceType) {
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType)!
        if UIImagePickerController.isSourceTypeAvailable(sourceType) && mediaTypes.count > 0 {
            let picker = UIImagePickerController()
            picker.mediaTypes = mediaTypes
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        lastChosenMediaType = info[UIImagePickerControllerMediaType] as? String
        if let mediaType = lastChosenMediaType {
            if mediaType == (kUTTypeImage as NSString) as String {
                image = info[UIImagePickerControllerEditedImage] as? UIImage
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:nil)
    }
}

// *******OBERSERVER******

struct Observable<T> {
    
    // Holds a collection of objects that want to observe changes
    // in the model
    var observers: [(T)->()] = []
    
    // Uses a property observer to perform an action whenever the
    // value changes.  It calls each of the observers with the result.
    var value: T {
        didSet {
            observers.forEach { $0(value) }
        }
    }
    
    // Allows an object to register itself as an observer.
    mutating func observe(observer: @escaping (T)->()) {
        observers.append(observer)
    }
    
    init (value: T) {
        self.value = value
    }
}

