import UIKit

class ApiTestNew : UIViewController {

    var parsedJSON: Any = "This is initial value"
    var foodNDBNO: String = "This is initial value"
    var foodName: String = "This is initial value"
    var nutrientName: String = "This is initial value"
    var nutrientValue: Double = -1.0
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiUrl1 = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0"
        let apiUrl2 = "https://api.nal.usda.gov/ndb/reports/?ndbno=11124&type=b&format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU"
        
        let myOperationsQueue = OperationQueue()
        let firstSemaphore = DispatchSemaphore(value: 0)
        
        updateParsedJSON(urlString: apiUrl1, myOperationsQueue: myOperationsQueue, semaphore: firstSemaphore)
        firstSemaphore.wait(timeout: DispatchTime.distantFuture)
        updateNDBNO(parsedJSON: parsedJSON)
        
        let secondSemaphore = DispatchSemaphore(value: 0)

        updateParsedJSON(urlString: apiUrl2, myOperationsQueue: myOperationsQueue, semaphore: secondSemaphore)
        secondSemaphore.wait(timeout: DispatchTime.distantFuture)
        updateNutrientInfo(parsedJSON: parsedJSON)
        
        print("This is foodName: \(self.foodName) | This is foodNDBNO: \(self.foodNDBNO) | This is nutrientName: \(self.nutrientName) | This is nutrientValue: \(self.nutrientValue)")
//        print("This is foodName: \(self.foodName) | This is foodNDBNO: \(self.foodNDBNO)")
//        print("This is nutrientName: \(self.nutrientName) | This is nutrientValue: \(self.nutrientValue)")
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
    
    func updateNutrientInfo (parsedJSON: Any) {
        if let reportDict = (parsedJSON as AnyObject).value(forKey: "report") as? NSDictionary {
            let foodDict = reportDict.value(forKey: "food") as! NSDictionary
            let nutrientsArray = foodDict.value(forKey: "nutrients") as! NSArray
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
            
            self.nutrientName = firstNutrientDict.value(forKey: "name") as! String
            let strValue = firstNutrientDict.value(forKey: "value") as! String
            let unformattedValue = Double(strValue)!
            let unit = firstNutrientDict.value(forKey: "unit") as! String
            
            if unit == "µg" {
                let formattedValue = unformattedValue/1000000
                self.nutrientValue = formattedValue
            }
                
            else if unit == "mg" {
                let formattedValue = unformattedValue/1000
                self.nutrientValue = formattedValue
            }
                
            else {
                self.nutrientValue = unformattedValue
            }
        }
    }
}


