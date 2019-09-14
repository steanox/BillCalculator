//
//  BillCalculatorUITests.swift
//  BillCalculatorUITests
//
//  Created by octavianus on 13/09/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import XCTest

class BillCalculatorUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberButton() {
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        
        let commandLabel = app.staticTexts["12"]
        
        XCTAssertTrue(commandLabel.exists)
    }
    
    func testBasicTaxAndServiceCalculation(){
        let app = XCUIApplication()
        
        // Add 2000
        app.buttons["2"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        
        
        // Multiply
        app.buttons["*"].tap()
        
        //By
        app.buttons["5"].tap()
        
        // Equal
        app.buttons["="].tap()
        
        let commandLabel = app.staticTexts["20000*5"]
        XCTAssertTrue(commandLabel.exists)
        
        let resultLabel = app.staticTexts["100000"]
        XCTAssertTrue(resultLabel.exists)
        
        
        
        
    }

}
