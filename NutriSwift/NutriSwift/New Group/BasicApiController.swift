import UIKit

class BasicApiController : UIViewController {
    
    var myData: Any = "This is initial value"
    let session = URLSession.shared
    
    override func viewDidLoad() {
        print("Start Basic Api Controller")
        super.viewDidLoad()
        let apiUrl = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0"
        print("This is myData before getParsedJSON: \(self.myData)")
        getParsedJSON(urlString: apiUrl)
        print("This is myData after getParsedJSON: \(self.myData)")
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
//                        print(self.myData)
                        
                        
                        // Rodney Test Code:
//                        let parsedResult: [String: Any]?
//
//                        if let listDict = (parsedResult as AnyObject).value(forKey: "report") as? NSDictionary {
//                            let itemArray = listDict.value(forKey: "food") as! NSDictionary
//                            let firstItemDict: String = itemArray["name"] as! String
//                            self.firstItemName = itemArray["name"] as! String
//
//                            print(firstItemDict)
//                            print(self.firstItemName)
                        
                        
                        
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

