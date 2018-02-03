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

class BasicApiController : UIViewController {
    
    var myData: Any = "This is initial value"
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiUrl = "https://api.nal.usda.gov/ndb/search/?format=json&api_key=LzwajHcUxYY47kiXlUl5Oh7GOkGg9VN51OtR5fhU&q=carrot&ds=Standard+Reference&fg=Vegetables+and+Vegetable+Products&sort=r&max=25&offset=0"
        print(getParsedJSON(urlString: apiUrl))
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    func getParsedJSON (urlString: String) -> Any {
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
                        print(self.myData)
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
        return self.myData
    }

}

