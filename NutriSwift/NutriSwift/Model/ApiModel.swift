//
//  apiModel.swift
//  NutriSwift
//
//  Created by Hayden Farrier on 2/2/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import Foundation

class ApiModel {
    static let sharedInstance: ApiModel = ApiModel()
    private init() {
    }
    var parsedData: Any = "This IS THE INITIAL VALUE"
}
