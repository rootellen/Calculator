//
//  CalculatorWorker.swift
//  CalculatorUnitTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

protocol CalculatorWorkerProtocol {
    func sum(num1: Float, num2: Float) -> Float
    func subtraction(num1: Float, num2: Float) -> Float
    func multiplication(num1: Float, num2: Float) -> Float
    func division(num1: Float, num2: Float) -> Float
}

class CalculatorWorker: CalculatorWorkerProtocol {
    func sum(num1: Float, num2: Float) -> Float {
        let result = num1 + num2
        return result
    }
    
    func subtraction(num1: Float, num2: Float) -> Float {
        let result = num1 - num2
        return result
    }
    
    func multiplication(num1: Float, num2: Float) -> Float {
        let result = num1 * num2
        return result
    }
    
    func division(num1: Float, num2: Float) -> Float {
        let result = num1 / num2
        return result
    }
    
}
