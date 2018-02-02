//
//  MovieDetailController.swift
//  MyMoviesSolution
//
//  Created by Rodney Cocker on 23/01/18.
//  Copyright © 2018 RMIT. All rights reserved.
//

// first result is raw carrot (what we want?)
//    https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0
// broccoli
//    https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=broccoli&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0
// https://api.nal.usda.gov/ndb/reports/?ndbno=11124&type=b&format=json&api_key=DEMO_KEY
// this is actual food data accessed by demo key

//NDB No for standard reference (e.g non branded) go from 01001 to 93600
//Need (Vitamin A, RAE), Thiamin, Riboflavin, Niacin, Vitamin B-6

import UIKit

class apiTestController: UIViewController {
    
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onFetch(_ sender: Any) {
        
        //        let findMovieId = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0"
//        let findMovieId = "https://api.nal.usda.gov/ndb/reports/?ndbno=11124&type=b&format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU"
        let findMovieId = "https://api.nal.usda.gov/ndb/reports/?ndbno=11124&type=b&format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU"
        
        if let url = URL(string: findMovieId) {
            let request = URLRequest(url: url)
            //            updateNDBNO(request)
//            NutrientInfo(request)
            getParsedJSON(urlString: "https://api.nal.usda.gov/ndb/reports/?ndbno=11124&type=b&format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU")
        }
    }
    
    func updateNDBNO (_ request: URLRequest){
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            if let error = downloadError {
                print("\(data) \n data")
                print("\(response) \n response")
                print("\(error)\n error")
            }
            else {
                let parsedResult: Any!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch let error as NSError {
                    parsedResult = nil
                }
                catch {
                    fatalError()
                }
                if let listDict = (parsedResult as AnyObject).value(forKey: "list") as? NSDictionary {
                    let itemArray = listDict.value(forKey: "item") as! NSArray
                    let firstItemDict: NSDictionary = itemArray[0] as! NSDictionary
                    let firstItemName = firstItemDict.value(forKey: "name") as! String
                    let NDBNO = firstItemDict.value(forKey: "ndbno") as! String
                    print(firstItemName)
                    print(NDBNO)
                }
            }
        })
        task.resume()
    }
    
    func getParsedJSON (urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
                if let error = downloadError {
                    print("\(data) \n data")
                    print("\(response) \n response")
                    print("\(error)\n error")
                }
                else {
                    let parsedResult: Any!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    }
                    catch let error as NSError {
                        parsedResult = nil
                    }
                    catch {
                        fatalError()
                    }
                    print(ApiModel.sharedInstance.parsedData)
                    ApiModel.sharedInstance.parsedData = "DID I CHANGE?"
                }
            })
            task.resume()
        }
        print(ApiModel.sharedInstance.parsedData)
        
    }
    
    func NutrientInfo (_ request: URLRequest){
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {data, response, downloadError in
            if let error = downloadError {
                print("\(data) \n data")
                print("\(response) \n response")
                print("\(error)\n error")
            }
            else {
                let parsedResult: Any!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                }
                catch let error as NSError {
                    parsedResult = nil
                }
                catch {
                    fatalError()
                }
                //                print(parsedResult)
                if let reportDict = (parsedResult as AnyObject).value(forKey: "report") as? NSDictionary {
                    let foodDict = reportDict.value(forKey: "food") as! NSDictionary
                    let nutrientsArray = foodDict.value(forKey: "nutrients") as! NSArray
                    print(nutrientsArray.count)
                    var nutrientCounter = 0
                    var targetNutrient = "Riboflavin"
                    while nutrientCounter < nutrientsArray.count {
                        var thisNutrientDict = nutrientsArray[nutrientCounter] as! NSDictionary
                        if thisNutrientDict.value(forKey: "name") as! String == targetNutrient {
                            break
                        }
                        nutrientCounter += 1
                    }
                    
                    
                    let firstNutrientDict = nutrientsArray[nutrientCounter] as! NSDictionary

                    if firstNutrientDict.value(forKey: "name") as! String == targetNutrient {
                        print("It's a match!")
                    }
                    
                    let nutrientsName = firstNutrientDict.value(forKey: "name") as! String
                    let nutrientsValue = firstNutrientDict.value(forKey: "value") as! String
                    let valueDouble = Double(nutrientsValue)!
                    let unit = firstNutrientDict.value(forKey: "unit") as! String
                    
                    
                    print(nutrientsName)
                    if unit == "µg" {
                        let formattedValue = valueDouble/1000000
                        print(formattedValue)
                    }
                    
                    else if unit == "mg" {
                        let formattedValue = valueDouble/1000
                        print(formattedValue)
                    }
                    
                    else {
                        print(valueDouble)
                    }
                    
                    
//                    print(unit)
                    //                    Model.sharedInstance.NDBNO = firstItemDict.value(forKey: "ndbno") as! String
                }
            }
        })
        task.resume()
    }
    
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}

