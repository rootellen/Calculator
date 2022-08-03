//
//  CalculatorInteractorTests.swift
//  CalculatorUnitTestsTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

import XCTest
@testable import Calculator

final class CalculatorInteractorTests: XCTestCase {
    var calculatorSpy: CalculatorWorkerSpy!
    var calculatorPresenterSpy: CalculatorPresenterSpy!
    var sut: CalculatorInteractor!
    
    override func setUp() {
        calculatorSpy = CalculatorWorkerSpy()
        calculatorPresenterSpy = CalculatorPresenterSpy()
        sut = CalculatorInteractor(calculator: calculatorSpy, presenter: calculatorPresenterSpy)
    }
    
    override func tearDown() {
        calculatorSpy = nil
        calculatorPresenterSpy = nil
        sut = nil
    }
    
    // MARK: SumTests
    func testSumWhenHasNoGivenNumbersShouldPresentError() {
        sut.sum(numberOne: nil, numberTwo: nil)
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndSumIsRequestedShouldSuccess() throws {
        calculatorSpy.stubbedSumResult = 5
        
        sut.sum(numberOne: "10", numberTwo: "5")
        
        XCTAssertTrue(calculatorSpy.invokedSum)
        XCTAssertEqual(calculatorSpy.invokedSumCount, 1)
        
        let invokedSumParameters = try XCTUnwrap(calculatorSpy.invokedSumParameters)
       
        XCTAssertEqual(invokedSumParameters.num1, 10)
        XCTAssertEqual(invokedSumParameters.num2, 5)
        
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    func testHasInvalidNumbersAndSumIsRequestedShouldPresentError() {
        sut.subtraction(numberOne: "a", numberTwo: "b")
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    // MARK: SubtractionTests
    func testSubtractionWhenHasNoGivenNumbersShouldPresentError() {
        sut.subtraction(numberOne: nil, numberTwo: nil)
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndSubtractionIsRequestedShouldSuccess() throws {
        calculatorSpy.stubbedSubtractionResult = 15
        
        sut.subtraction(numberOne: "10", numberTwo: "5")
        
        XCTAssertTrue(calculatorSpy.invokedSubtraction)
        XCTAssertEqual(calculatorSpy.invokedSubtractionCount, 1)
        
        let invokedSubtraction = try XCTUnwrap(calculatorSpy.invokedSubtractionParameters)
       
        XCTAssertEqual(invokedSubtraction.num1, 10)
        XCTAssertEqual(invokedSubtraction.num2, 5)
        
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    func testHasInvalidNumbersAndSubtractionIsRequestedShouldPresentError() {
        sut.subtraction(numberOne: "a", numberTwo: "b")
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    // MARK: MultiplicationTests
    func testMultiplicationWhenHasNoGivenNumbersShouldPresentError() {
        sut.multiplication(numberOne: nil, numberTwo: nil)
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndMultiplicationIsRequestedShouldSuccess() throws {
        calculatorSpy.stubbedMultiplicationResult = 50
        
        sut.multiplication(numberOne: "10", numberTwo: "5")
        
        XCTAssertTrue(calculatorSpy.invokedMultiplication)
        XCTAssertEqual(calculatorSpy.invokedMultiplicationCount, 1)
        
        let invokedMultiplication = try XCTUnwrap(calculatorSpy.invokedMultiplicationParameters)
       
        XCTAssertEqual(invokedMultiplication.num1, 10)
        XCTAssertEqual(invokedMultiplication.num2, 5)
        
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedSum)
    }
    
    func testHasInvalidNumbersAndMultiplicationIsRequestedShouldPresentError() {
        sut.multiplication(numberOne: "a", numberTwo: "b")
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    // MARK: DivisionTests
    func testDivisionWhenHasNoGivenNumbersShouldPresentError() {
        sut.division(numberOne: nil, numberTwo: nil)
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndDivisionIsRequestedShouldSuccess() throws {
        calculatorSpy.stubbedDivisionResult = 2
        
        sut.division(numberOne: "10", numberTwo: "5")
        
        XCTAssertTrue(calculatorSpy.invokedDivision)
        XCTAssertEqual(calculatorSpy.invokedDivisionCount, 1)
        
        let invokedDivision = try XCTUnwrap(calculatorSpy.invokedDivisionParameters)
       
        XCTAssertEqual(invokedDivision.num1, 10)
        XCTAssertEqual(invokedDivision.num2, 5)
        
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedSum)
    }
    
    func testHasInvalidNumbersAndDivisionIsRequestedShouldPresentError() {
        sut.division(numberOne: "a", numberTwo: "b")
        
        XCTAssertFalse(calculatorSpy.invokedSum)
        XCTAssertFalse(calculatorSpy.invokedDivision)
        XCTAssertFalse(calculatorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorSpy.invokedMultiplication)
    }
}
