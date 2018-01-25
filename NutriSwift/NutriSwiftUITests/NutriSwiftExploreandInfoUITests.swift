//
//  NutriSwiftTests.swift
//  NutriSwiftTests
//
//  Created by Hayden Farrier on 1/15/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import XCTest
@testable import NutriSwift

class NutriSwiftTests: XCTestCase {
    
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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    

        
        func testExploreTabExist (){
            let app = XCUIApplication()
            XCTAssertEqual(app.tables.count, 1)
            
            app.tabBars.buttons["Explore"].tap()
            app.tables/*@START_MENU_TOKEN@*/.staticTexts["Gym Tips"]/*[[".cells.staticTexts[\"Gym Tips\"]",".staticTexts[\"Gym Tips\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.navigationBars["Explore Info"].buttons["Explore"].tap()
            XCTAssertEqual(app.tables.count, 1)
            
        }
    }
    


