//
//  CalculatorPresenterTests.swift
//  CalculatorTests
//
//  Created by Ruth Ellen da Silva on 02/08/22.
//

import XCTest
@testable import Calculator

final class CalculatorPresenterTests: XCTestCase {
    var sut: CalculatorPresenter!
    var displaySpy: CalculatorDisplaySpy!
    
    override func setUp() {
        displaySpy = CalculatorDisplaySpy()
        sut = CalculatorPresenter()
        sut.display = displaySpy
    }
    
    override func tearDown() {
        sut = nil
        displaySpy = nil
    }
    
    func testPresentInvalidNumbersError() throws {
        sut.presentInvalidNumberError()
        
        let resultExpected = "Verifique os valores informados."
        let resultColorExpected = UIColor.systemRed
        
        try assert(resultExpected: resultExpected, resultColorExpected: resultColorExpected)
    }
    
    // MARK: SumTests
    func testPresentSumOperationWithResult() throws {
        sut.present(operation: .sum, result: 15)
        
        let resultExpected = "O resultado da soma é: 15.0"
        let resultColorExpected = UIColor.systemGreen
        
        try assert(resultExpected: resultExpected, resultColorExpected: resultColorExpected)
    }
    
    // MARK: SubtractionTests
    func testPresentSubtractionOperationWithResult() throws {
        sut.present(operation: .subtract, result: 5)
        
        let resultExpected = "O resultado da subtração é: 5.0"
        let resultColorExpected = UIColor.systemGreen
        
        try assert(resultExpected: resultExpected, resultColorExpected: resultColorExpected)
    }
    
    // MARK: MultiplicationTests
    func testPresentMultiplicationOperationWithResult() throws {
        sut.present(operation: .multiplication, result: 50)
        
        let resultExpected = "O resultado da multiplicação é: 50.0"
        let resultColorExpected = UIColor.systemGreen
        
        try assert(resultExpected: resultExpected, resultColorExpected: resultColorExpected)
    }
    
    // MARK: DivisionTests
    func testPresentDivisionOperationWithResult() throws {
        sut.present(operation: .division, result: 2)
        
        let resultExpected = "O resultado da divisão é: 2.0"
        let resultColorExpected = UIColor.systemGreen
        
        try assert(resultExpected: resultExpected, resultColorExpected: resultColorExpected)
    }
    
    private func assert(resultExpected: String, resultColorExpected: UIColor) throws {
        XCTAssertTrue(displaySpy.invokedDisplay)
        XCTAssertEqual(displaySpy.invokedDisplayCount, 1)
        
        let invokedDisplayParameters = try XCTUnwrap(displaySpy.invokedDisplayParameters)
        
        XCTAssertEqual(invokedDisplayParameters.viewModel.text, resultExpected)
        XCTAssertEqual(invokedDisplayParameters.viewModel.textColor, resultColorExpected)
    }
}
