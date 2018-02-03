//NDB No for standard reference (e.g non branded) go from 01001 to 93600
//Need (Vitamin A, RAE), Thiamin, Riboflavin, Niacin, Vitamin B-6

import UIKit

class ApiTestNew : UIViewController {

    var parsedJSON: Any = "This is initial value"
    var foodNDBNO: String = "This is initial value"
    var foodName: String = "This is initial value"
    var nutrientName: String = "This is initial value"
    var nutrientValue: Double = -1.0
    let nutrientsRequired = ["Vitamin A, RAE", "Thiamin", "Riboflavin", "Niacin", "Vitamin B-6"]
    var nutrientTupleArray: [(String, Double)] = []
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userInput = "potato"
        let apiUrl1 = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=" + userInput + "&ds=Standard+Reference&sort=r&max=25&offset=0"
        
        let myOperationsQueue = OperationQueue()
        let firstSemaphore = DispatchSemaphore(value: 0)
        
        updateParsedJSON(urlString: apiUrl1, myOperationsQueue: myOperationsQueue, semaphore: firstSemaphore)
        firstSemaphore.wait(timeout: DispatchTime.distantFuture)
        updateNDBNO(parsedJSON: parsedJSON)
        
        print("This is foodName: \(self.foodName) | This is foodNDBNO: \(self.foodNDBNO)")
        
        
        let apiUrl2 = "https://api.nal.usda.gov/ndb/reports/?ndbno=" + self.foodNDBNO + "&type=b&format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU"

        for nutrient in nutrientsRequired {
            let secondSemaphore = DispatchSemaphore(value: 0)
            updateParsedJSON(urlString: apiUrl2, myOperationsQueue: myOperationsQueue, semaphore: secondSemaphore)
            secondSemaphore.wait(timeout: DispatchTime.distantFuture)
            updateNutrientInfo(parsedJSON: parsedJSON, targetNutrient: nutrient)
        }

        print("Nutrient0: \(self.nutrientTupleArray[0].0), \(self.nutrientTupleArray[0].1) | Nutrient1: \(self.nutrientTupleArray[1].0), \(self.nutrientTupleArray[1].1) | Nutrient2: \(self.nutrientTupleArray[2].0), \(self.nutrientTupleArray[2].1) | Nutrient3: \(self.nutrientTupleArray[3].0), \(self.nutrientTupleArray[3].1) | Nutrient4: \(self.nutrientTupleArray[4].0), \(self.nutrientTupleArray[4].1)")
    }
    
    func updateParsedJSON (urlString: String, myOperationsQueue: OperationQueue, semaphore: DispatchSemaphore) {
        myOperationsQueue.addOperation({
//            let session = URLSession.shared
            let request = URLRequest(url: URL(string: urlString)!)
            
            let task = self.session.dataTask(with: request, completionHandler: {data, response, downloadError in
                if let error = downloadError {
                    print("\(data) \n data")
                    print("\(response) \n response")
                    print("\(error)\n error")
                }
                else {
                    let parsedResult: Any!
                    do {
                        parsedResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                        self.parsedJSON = parsedResult
                    }
                    catch let error as NSError {
                        parsedResult = nil
                    }
                    catch {
                        fatalError()
                    }
                }
                semaphore.signal();
            })
            task.resume()
        })
    }
    
    func updateNDBNO (parsedJSON: Any) {
        if let listDict = (parsedJSON as AnyObject).value(forKey: "list") as? NSDictionary {
            let itemArray = listDict.value(forKey: "item") as! NSArray
            let firstItemDict: NSDictionary = itemArray[0] as! NSDictionary
            self.foodName = firstItemDict.value(forKey: "name") as! String
            self.foodNDBNO = firstItemDict.value(forKey: "ndbno") as! String
        }
    }
    
    func updateNutrientInfo (parsedJSON: Any, targetNutrient: String) {
        if let reportDict = (parsedJSON as AnyObject).value(forKey: "report") as? NSDictionary {
            let foodDict = reportDict.value(forKey: "food") as! NSDictionary
            let nutrientsArray = foodDict.value(forKey: "nutrients") as! NSArray
            var nutrientCounter = 0
            while nutrientCounter < nutrientsArray.count {
                let thisNutrientDict = nutrientsArray[nutrientCounter] as! NSDictionary
                if thisNutrientDict.value(forKey: "name") as! String == targetNutrient {
                    break
                }
                nutrientCounter += 1
            }
            
            let firstNutrientDict = nutrientsArray[nutrientCounter] as! NSDictionary
            
            let nutrientName = firstNutrientDict.value(forKey: "name") as! String
            let strValue = firstNutrientDict.value(forKey: "value") as! String
            let unformattedValue = Double(strValue)!
            let unit = firstNutrientDict.value(forKey: "unit") as! String
            var formattedValue: Double = -1.0
            if unit == "µg" {
                formattedValue = unformattedValue/1000000
            }
                
            else if unit == "mg" {
                formattedValue = unformattedValue/1000
            }
                
            else {
                formattedValue = unformattedValue
            }
            
            let nutrientTuple = (nutrientName, formattedValue)
            self.nutrientTupleArray.append(nutrientTuple)
        }
    }
}


