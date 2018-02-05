//
//  ProfileTest.swift
//  NutriSwift Unit Tests
//
//  Created by Hayden Farrier on 2/5/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import XCTest
@testable import NutriSwift
class ProfileTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
//        continueAfterFailure = false
//        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /* Default RDI Test:
    App user should have default RDI set to male 19-30 without saving a user profile
    RDI set should not be female 19-29 gender not chosen |or| gender chosen is not female
    RDI set should not be female 19-29 if no age is entered |or| age is inavlid |or| age is not between 19-29
    Once female is chosen data set should update to demonstrate change
    */
    
    
    // App user should have default RDI set to male 19-30 without saving a user profile (e.g user info is default)
    func defaultRDITest() {
        var user = User()
        XCTAssertNotNil(user.userName)
    }
    
}
