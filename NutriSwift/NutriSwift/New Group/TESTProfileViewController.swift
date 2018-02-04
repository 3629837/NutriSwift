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

class TESTProfileViewController: UIViewController {
    
    var userModel: UserModel = UserModel.sharedInstance
    // imageview to display loaded image
    @IBOutlet weak var imageView: UIImageView!
    
    // image picker for capture / load
    let imagePicker = UIImagePickerController()
    
    // dispatch queues
    let convertQueue = DispatchQueue(label: "convertQueue", attributes: .concurrent)
    let saveQueue = DispatchQueue(label: "saveQueue", attributes: .concurrent)
    
    // moc
    var managedContext : NSManagedObjectContext?
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerSetup() // image picker delegate and settings
        coreDataSetup() // set value of moc on the right thread
    }
    
    // this function displays the imagePicker
    @IBAction func capture(sender: AnyObject) { // button action
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func load(sender: AnyObject) { // button action
        
        loadImages { (images) -> Void in
            if let thumbnailData = images?.last?.thumbnail?.imageData {
                let image = UIImage(data: thumbnailData)
                self.imageView.image = image
            }
        }
    }
}

extension TESTProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerSetup() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        
    }
    // When an image is "picked" it will return through this function
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismiss(animated: true, completion: nil)
        prepareImageForSaving(image: image)
        
    }
}

extension TESTProfileViewController {
    func coreDataSetup() {
        dispatch_sync(saveQueue) {
            self.managedContext = AppDelegate().managedObjectContext
        }
    }
}

extension TESTProfileViewController {
    func loadImages(fetched:(_ images:[FullRes]?) -> Void) {
        saveQueue.async() {
            guard let moc = self.managedContext else {
                return
            }
            let fetchRequest = NSFetchRequest(entityName: "FullRes")
            do {
                let results = try moc.executeFetchRequest(fetchRequest)
                let imageData = results as? [FullRes]
                dispatch_get_main_queue().async() {
                    fetched(images: imageData)
                }
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
                return
            }
        }
    }
}

extension TESTProfileViewController {
    
    func prepareImageForSaving(image:UIImage) {
        
        // use date as unique id
        let date : Double = NSDate().timeIntervalSince1970
        
        // dispatch with gcd.
        convertQueue.async() {
            
            // create NSData from UIImage
            guard let imageData = UIImageJPEGRepresentation(image, 1) else {
                // handle failed conversion
                print("jpg error")
                return
            }
            
            // scale image, I chose the size of the VC because it is easy
            let thumbnail = image.scale(toSize: self.view.frame.size)
            
            guard let thumbnailData  = UIImageJPEGRepresentation(thumbnail, 0.7) else {
                // handle failed conversion
                print("jpg error")
                return
            }
            
            // send to save function
            self.saveImage(imageData, thumbnailData: thumbnailData, date: date)
            
        }
    }
}

