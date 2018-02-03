import UIKit


protocol Refresh{
    func updateUI(value: Any)
}

class BasicApiController : UIViewController, Refresh {
    
    func updateUI(value: Any) {
        self.myData = value
        print(self.myData)
    }
    
    
    
    var myData: Any = "This is initial value"
    let session = URLSession.shared
    
    override func viewDidLoad() {
        print("Start Basic Api Controller")
        super.viewDidLoad()
        
        
        let apiUrl = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0"
        print("This is myData before group: \(self.myData)")
        
        let group = DispatchGroup()
        group.enter()
        getParsedJSON(urlString: apiUrl)
        group.leave()
        group.notify(queue: .main) {
            print("This is myData after group: \(self.myData)")
        }

        
//        let apiUrl = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0"
//        print("This is myData before getParsedJSON: \(self.myData)")
//        getParsedJSON(urlString: apiUrl)
//        print("This is myData after getParsedJSON: \(self.myData)")
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
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
                        self.myData = parsedResult
//                        DispatchQueue.main.async(execute: {
//                            self.updateUI(value: parsedResult)
//                        })
                        
                        
//                        print(self.myData)
                        
                        
//                        if let listDict = (parsedResult as AnyObject).value(forKey: "list") as? NSDictionary {
//                            let itemArray = listDict.value(forKey: "item") as! NSArray
//
//                            let product = itemArray[0] as! [String: Any]
//
//                            let productName = product["name"] as! String
//                            DispatchQueue.main.async(execute: {
//                                self.updateUI(value: productName)
//                            })
                        
                        
                    }
                    catch let error as NSError {
                        parsedResult = nil
                    }
                    catch {
                        fatalError()
                    }
                }
            })
            task.resume()
        }
    }
}

