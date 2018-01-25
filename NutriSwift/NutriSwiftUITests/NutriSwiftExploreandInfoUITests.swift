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

    

    // Expecting 1 table view
    func testExploreTabExist (){
            let app = XCUIApplication()
           XCTAssertEqual(app.tables.count, 1)

        }
    
    //Expecting 3 rows on the table
    func testDiaryTableCellCount(){
        let app = XCUIApplication()
        let table = app.tables.element(at: 0)
        
        XCTAssertEqual(table.cells.count, 3)
        
    }
    
}
    


