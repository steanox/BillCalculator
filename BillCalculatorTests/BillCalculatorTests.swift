//
//  BillCalculatorTests.swift
//  BillCalculatorTests
//
//  Created by octavianus on 13/09/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import XCTest
@testable import BillCalculator

class BillCalculatorTests: XCTestCase {
    
    var calculatorEngine: CalculatorHelper!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.calculatorEngine = CalculatorHelper()
    }

    override func tearDown() {
        calculatorEngine = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExpression() {
        // Standard Equation
        XCTAssertEqual(self.calculatorEngine.result(commandStacks: "3 + 2"), 5)
        
        // Using bracket
        XCTAssertEqual(self.calculatorEngine.result(commandStacks: "33 + 9 * 10 / 5 "), 51)
        
        // Add number fragments
        XCTAssertEqual(self.calculatorEngine.result(commandStacks: "3.2"), 3.2)
        
        
        XCTAssertEqual(self.calculatorEngine.result(commandStacks: "3.9 * 10"), 39)
        
        XCTAssertEqual(self.calculatorEngine.result(commandStacks: "3.9 / 10"), 0.39)
        
    }
    func testPercentageCalculation(){
        
        XCTAssertEqual(self.calculatorEngine.getPercentageOf(10, from: 10), 1)
        
    }
    


    func testPerformanceExample() {
        
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
