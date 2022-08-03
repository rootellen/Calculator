//
//  CalculatorPresenterSpy.swift
//  CalculatorUnitTestsTests
//
//  Created by Ruth Ellen da Silva on 02/08/22.
//

@testable import Calculator

class CalculatorPresenterSpy: CalculatorPresenterProtocol {

    var invokedPresent = false
    var invokedPresentCount = 0
    var invokedPresentParameters: (operation: CalculatorPresenterOperation, result: Float)?
    var invokedPresentParametersList = [(operation: CalculatorPresenterOperation, result: Float)]()

    func present(operation: CalculatorPresenterOperation, result: Float) {
        invokedPresent = true
        invokedPresentCount += 1
        invokedPresentParameters = (operation, result)
        invokedPresentParametersList.append((operation, result))
    }

    var invokedPresentInvalidNumberError = false
    var invokedPresentInvalidNumberErrorCount = 0

    func presentInvalidNumberError() {
        invokedPresentInvalidNumberError = true
        invokedPresentInvalidNumberErrorCount += 1
    }
}
