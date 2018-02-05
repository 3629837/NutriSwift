//
//  ProfileTest.swift
//  NutriSwift Unit Tests
//
//  Created by Hayden Farrier on 2/5/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import XCTest
@testable import NutriSwift
class RDIUserTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
//        continueAfterFailure = false
//        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /* RDI/User relationship Test:
     1) testNoProfile: App user should have default RDI set to male 19-29 without saving a user profile (e.g user info is default)
     2) testNotFalseFemaleRDI: RDI set should not be female (19-29) if : female not chosen |or| age is not 19-29
     3) testOtherRDI: RDI set should default to male (of the selected age group) if 'other' is chosen (this is because male RDIs are on average higher
     so it is overall a safer guide: if 'other' gender chosen RDI should be equal to male of same age
     4) testMaleToFemaleUpdate: Once female is chosen data set should update to demonstrate change
    */
    
    func testUserProfile() {
        testNoProfile()
    }
    
    // App user should have default RDI set to male 19-30 without saving a user profile (e.g user info is default)
    func testNoProfile() {
        // Assuming user has not made a profile, and has instead clicked into Nutrition tab
        // A 'temporary' user is created with userName = "", userAge = 0.0, userGender = ""
        UserModel.sharedInstance.saveUser("", userAge: 0.0, userGender: "")
        UserModel.sharedInstance.getUsers()
        let user = UserModel.sharedInstance.userDB[0]
        let m19RDI = NutritionModel.get.m19nutritionRDI
        let userRDI = NutritionModel.get.getRDIGroup (user: user, m19RDI: NutritionModel.get.m19nutritionRDI, f19RDI: NutritionModel.get.f19nutritionRDI)
        
        //Ensure userRDI == male 19-29 RDI
        //We can do this by checking RDI of a vitamin A which is male/female 0.0009/0.0007g
        // we also want to first make sure the RDI is indeed the male RDI
        XCTAssertEqual(userRDI[0].RDI, 0.0009)
        XCTAssertEqual(userRDI[0].RDI, m19RDI[0].RDI)
    }
    
    func testNotFalseFemaleRDI() {
        // User profile with female not chosen or with age not 19-29 should not give female 19-29 RDI
        // Female not chosen (e.g User("Hayden", 22, "Male"))
        UserModel.sharedInstance.saveUser("Hayden", userAge: 22.0, userGender: "Male")
        UserModel.sharedInstance.getUsers()
        let user = UserModel.sharedInstance.userDB[0]
        let f19RDI = NutritionModel.get.f19nutritionRDI
        let userRDI = NutritionModel.get.getRDIGroup (user: user, m19RDI: NutritionModel.get.m19nutritionRDI, f19RDI: NutritionModel.get.f19nutritionRDI)

        //Ensure userRDI != female 19-29 RDI
        //We can do this by checking RDI of a vitamin A which is male/female 0.0009/0.0007g
        // we also want to first make sure the RDI is indeed the male RDI (expected)
        XCTAssertEqual(userRDI[0].RDI, m19RDI[0].RDI)
        XCTAssertNotEqual(userRDI[0].RDI, f19RDI[0].RDI)
        
        UserModel.sharedInstance.deleteUser(user)
        
        // Incorrect age (e.g User("Asli", 33, "Female"))
        UserModel.sharedInstance.saveUser("Asli", userAge: 33.0, userGender: "Female")
        UserModel.sharedInstance.getUsers()
        
        let user2 = UserModel.sharedInstance.userDB[0]
        let userRDI2 = NutritionModel.get.getRDIGroup (user: user2, m19RDI: NutritionModel.get.m19nutritionRDI, f19RDI: NutritionModel.get.f19nutritionRDI)
        
        //Ensure userRDI != female 19-29 RDI
        // We can do this by checking RDI of a vitamin A which is male/female 0.0009/0.0007g
        // we also want to first make sure the RDI is indeed the male RDI (expected as is default and age >29 is not supported)
        XCTAssertEqual(userRDI2[0].RDI, 0.0009)
        XCTAssertNotEqual(userRDI2[0].RDI, f19RDI[0].RDI)
    }
    
}
