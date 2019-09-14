//
//  CalculatorHelper.swift
//  BillCalculator
//
//  Created by octavianus on 14/09/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import Foundation

class CalculatorHelper{
    public func result(commandStacks: String) -> Double{
        let expression = NSExpression(format: commandStacks)
        return expression.expressionValue(with: nil, context: nil) as! Double
    }
    
    public func getPercentageOf(_ percent: Double,from value: Double) -> Double{
        return (percent / 100 * value)
    }
    
    public func forTrailingZero(temp: Double) -> String {
        var tempVar = String(format: "%g", temp)
        return tempVar
    }
}
