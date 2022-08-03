//
//  CalculatorInteractorSpy.swift
//  CalculatorTests
//
//  Created by Ruth Ellen da Silva on 03/08/22.
//

@testable import Calculator

class CalculatorInteractorSpy: CalculatorInteractorProtocol {

    var invokedSum = false
    var invokedSumCount = 0
    var invokedSumParameters: (numberOne: String?, numberTwo: String?)?
    var invokedSumParametersList = [(numberOne: String?, numberTwo: String?)]()

    func sum(numberOne: String?, numberTwo: String?) {
        invokedSum = true
        invokedSumCount += 1
        invokedSumParameters = (numberOne, numberTwo)
        invokedSumParametersList.append((numberOne, numberTwo))
    }

    var invokedSubtraction = false
    var invokedSubtractionCount = 0
    var invokedSubtractionParameters: (numberOne: String?, numberTwo: String?)?
    var invokedSubtractionParametersList = [(numberOne: String?, numberTwo: String?)]()

    func subtraction(numberOne: String?, numberTwo: String?) {
        invokedSubtraction = true
        invokedSubtractionCount += 1
        invokedSubtractionParameters = (numberOne, numberTwo)
        invokedSubtractionParametersList.append((numberOne, numberTwo))
    }

    var invokedMultiplication = false
    var invokedMultiplicationCount = 0
    var invokedMultiplicationParameters: (numberOne: String?, numberTwo: String?)?
    var invokedMultiplicationParametersList = [(numberOne: String?, numberTwo: String?)]()

    func multiplication(numberOne: String?, numberTwo: String?) {
        invokedMultiplication = true
        invokedMultiplicationCount += 1
        invokedMultiplicationParameters = (numberOne, numberTwo)
        invokedMultiplicationParametersList.append((numberOne, numberTwo))
    }

    var invokedDivision = false
    var invokedDivisionCount = 0
    var invokedDivisionParameters: (numberOne: String?, numberTwo: String?)?
    var invokedDivisionParametersList = [(numberOne: String?, numberTwo: String?)]()

    func division(numberOne: String?, numberTwo: String?) {
        invokedDivision = true
        invokedDivisionCount += 1
        invokedDivisionParameters = (numberOne, numberTwo)
        invokedDivisionParametersList.append((numberOne, numberTwo))
    }
}
