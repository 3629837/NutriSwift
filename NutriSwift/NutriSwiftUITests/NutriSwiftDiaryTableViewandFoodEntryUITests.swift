//
//  NutriSwiftUITests.swift
//  NutriSwiftUITests
//
//  Created by Hayden Farrier on 1/15/18.
//  Copyright © 2018 Hayden Farrier. All rights reserved.
//

import XCTest
@testable import NutriSwift
class NutriSwiftDiaryTableViewandFoodEntryUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        //        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    //It is expected to have 1 table view on Diary screen
    func testDiaryTableCount (){
        
        let app = XCUIApplication()
        XCTAssertEqual(app.tables.count, 1)
        
    }
    //
    func testDiaryTableCellCount(){
        let app = XCUIApplication()
        let table = app.tables.element(at: 0)

               XCTAssertEqual(table.cells.count, 0)

    }
    
    //Diary Table is expected to have 5 buttons on the screen
    func testDiaryTableButtonCount(){
        let app = XCUIApplication()
        XCTAssertEqual(app.buttons.count, 5)
    }
    
    //This is a use case (When user is at the Diary screen) where the user is clicking "Add" button on the top right, then enters Name as "Apple", enters Weight as "70" and chooses "Breakfast" on the meal from the pickWheel then presses Save at the top right and then presses Confirm. Then application takes the user back to the Diary screen which is updated now and showing "Apple" on their meal section.
    //So the Diary is initially empty, after user enters a food and decides to Save, the diary gets updated with the relevant food.
    
    func testDiaryTableViewUpdateSuccesfully() {
        

        
        
//        let app = XCUIApplication()
//        let table = app.tables.element(at: 0)
//        XCTAssertEqual(table.cells.count, 0)
//         XCTAssert(app.navigationBars["Diary"].exists)
//        app.navigationBars["Diary"].buttons["Add"].tap()
//
//        let nameTextField = app.textFields["Name"]
//        nameTextField.tap()
//        nameTextField.typeText("Apple")
//
//        let foodNameToType = "Apple"
//        let textFieldText = nameTextField.value as! String
//        XCTAssertEqual(textFieldText, foodNameToType)
//
//        let weightGTextField = app.textFields["Weight (g)"]
//        weightGTextField.tap()
//        weightGTextField.tap()
//        weightGTextField.typeText("50")
//
//        let weightToType = "50"
//        let weightTextArea = weightGTextField.value as! String
//        XCTAssertEqual(weightTextArea, weightToType)
//
//        app/*@START_MENU_TOKEN@*/.pickerWheels["Breakfast"]/*[[".pickers.pickerWheels[\"Breakfast\"]",".pickerWheels[\"Breakfast\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Food Entry"].buttons["Save"].tap()
//        app.alerts["Confirm Food Entry"].buttons["Confirm"].tap()
//
//        let nameLabelAfterSavingTheFood = nameTextField.value as! String
//        XCTAssertEqual(nameLabelAfterSavingTheFood, "Apple")
//        let weightLabelAfterSavingTheFood = weightGTextField.value as! String
//        XCTAssertEqual(weightLabelAfterSavingTheFood, "50")
//
//        //row was 0 before, since the user added food now it is increased to 1
//        XCTAssertEqual(table.cells.count, 1)
        
    }
    
    
    
    
    
}
