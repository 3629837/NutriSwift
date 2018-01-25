//
//  NutriSwiftTests.swift
//  NutriSwiftTests
//
//  Created by Hayden Farrier on 1/15/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import XCTest
@testable import NutriSwift

class ProfilePageUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = true
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    // Expecting 0 table view
    func testThereIsNoTableViewOnProfilePage (){
        let app = XCUIApplication()
        XCTAssertEqual(app.tables.count, 0)
        
    }
    
    //Profile page is expected to have 1 button on the screen  "Save"
    func testProfilePageButtonCount(){
        let app = XCUIApplication()
        XCTAssertEqual(app.buttons.count, 1)
    }
    
    
    //Expecting 3 text fields on profile screen
    func testProfilePageTextFieldCount(){
        let app = XCUIApplication()
        XCTAssertEqual(app.textFields.count, 3)
    }
    
    //Expecting 3 labels
    func testProfilePageLabelCount(){
        let app = XCUIApplication()
        let numLabels = app.staticTexts.count
        XCTAssertEqual(numLabels, 3)
    }
    
    //Expecting 3 labels
    func testProfilePageLabCount(){

    }
}
