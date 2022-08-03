//
//  CalculatorWorkerSpy.swift
//  CalculatorUnitTestsTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

@testable import Calculator

class CalculatorWorkerSpy: CalculatorWorkerProtocol {

    var invokedSum = false
    var invokedSumCount = 0
    var invokedSumParameters: (num1: Float, num2: Float)?
    var invokedSumParametersList = [(num1: Float, num2: Float)]()
    var stubbedSumResult: Float! = 0

    func sum(num1: Float, num2: Float) -> Float {
        invokedSum = true
        invokedSumCount += 1
        invokedSumParameters = (num1, num2)
        invokedSumParametersList.append((num1, num2))
        return stubbedSumResult
    }

    var invokedSubtraction = false
    var invokedSubtractionCount = 0
    var invokedSubtractionParameters: (num1: Float, num2: Float)?
    var invokedSubtractionParametersList = [(num1: Float, num2: Float)]()
    var stubbedSubtractionResult: Float! = 0

    func subtraction(num1: Float, num2: Float) -> Float {
        invokedSubtraction = true
        invokedSubtractionCount += 1
        invokedSubtractionParameters = (num1, num2)
        invokedSubtractionParametersList.append((num1, num2))
        return stubbedSubtractionResult
    }

    var invokedMultiplication = false
    var invokedMultiplicationCount = 0
    var invokedMultiplicationParameters: (num1: Float, num2: Float)?
    var invokedMultiplicationParametersList = [(num1: Float, num2: Float)]()
    var stubbedMultiplicationResult: Float! = 0

    func multiplication(num1: Float, num2: Float) -> Float {
        invokedMultiplication = true
        invokedMultiplicationCount += 1
        invokedMultiplicationParameters = (num1, num2)
        invokedMultiplicationParametersList.append((num1, num2))
        return stubbedMultiplicationResult
    }

    var invokedDivision = false
    var invokedDivisionCount = 0
    var invokedDivisionParameters: (num1: Float, num2: Float)?
    var invokedDivisionParametersList = [(num1: Float, num2: Float)]()
    var stubbedDivisionResult: Float! = 0

    func division(num1: Float, num2: Float) -> Float {
        invokedDivision = true
        invokedDivisionCount += 1
        invokedDivisionParameters = (num1, num2)
        invokedDivisionParametersList.append((num1, num2))
        return stubbedDivisionResult
    }
}
