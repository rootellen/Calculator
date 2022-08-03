//
//  CalculatorViewController.swift
//  CalculatorTests
//
//  Created by Ruth Ellen da Silva on 03/08/22.
//

import XCTest
@testable import Calculator

final class CalculatorViewControllerTests: XCTestCase {
    private var sut: CalculatorViewController!
    private var calculatorInteractorSpy: CalculatorInteractorSpy!
    
    override func setUp() {
        super.setUp()
        
        calculatorInteractorSpy = CalculatorInteractorSpy()
        sut = CalculatorViewController()
        sut.interactor = calculatorInteractorSpy
    }
    
    override func tearDown() {
        calculatorInteractorSpy = nil
        sut = nil
        
        super.tearDown()
    }
    
    // MARK: SumTests
    func testHasNoGivenNumbersAndSumIsRequestedShouldError() throws {
        sut.onSumButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedSum)
        XCTAssertEqual(calculatorInteractorSpy.invokedSumCount, 1)
        
        let invokedSumCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedSumParameters)
        
        XCTAssertEqual(invokedSumCountParameters.numberOne, "")
        XCTAssertEqual(invokedSumCountParameters.numberTwo, "")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedDivision)
        XCTAssertFalse(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorInteractorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndSumIsRequestedShouldSuccess() throws {
        sut.numberOneTextField.text = "10"
        sut.numberTwoTextField.text = "5"
        
        sut.onSumButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedSum)
        XCTAssertEqual(calculatorInteractorSpy.invokedSumCount, 1)
        
        let invokedSumCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedSumParameters)
        
        XCTAssertEqual(invokedSumCountParameters.numberOne, "10")
        XCTAssertEqual(invokedSumCountParameters.numberTwo, "5")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedDivision)
        XCTAssertFalse(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorInteractorSpy.invokedMultiplication)
    }
    
    // MARK: SubtractionTests
    func testHasNoGivenNumbersAndSubtractIsRequestedShouldError() throws {
        sut.onSubtractionButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertEqual(calculatorInteractorSpy.invokedSubtractionCount, 1)
        
        let invokedSubtractionCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedSubtractionParameters)
        
        XCTAssertEqual(invokedSubtractionCountParameters.numberOne, "")
        XCTAssertEqual(invokedSubtractionCountParameters.numberTwo, "")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedDivision)
        XCTAssertFalse(calculatorInteractorSpy.invokedSum)
        XCTAssertFalse(calculatorInteractorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndSubtractionIsRequestedShouldSuccess() throws {
        sut.numberOneTextField.text = "10"
        sut.numberTwoTextField.text = "5"
        
        sut.onSubtractionButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertEqual(calculatorInteractorSpy.invokedSubtractionCount, 1)
        
        let invokedSubtractionCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedSubtractionParameters)
        
        XCTAssertEqual(invokedSubtractionCountParameters.numberOne, "10")
        XCTAssertEqual(invokedSubtractionCountParameters.numberTwo, "5")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedDivision)
        XCTAssertFalse(calculatorInteractorSpy.invokedSum)
        XCTAssertFalse(calculatorInteractorSpy.invokedMultiplication)
    }
    
    // MARK: MultiplicationTests
    func testHasNoGivenNumbersAndMultiplicationIsRequestedShouldError() throws {
        sut.onMultiplicationButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedMultiplication)
        XCTAssertEqual(calculatorInteractorSpy.invokedMultiplicationCount, 1)
        
        let invokedMultiplicationCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedMultiplicationParameters)
        
        XCTAssertEqual(invokedMultiplicationCountParameters.numberOne, "")
        XCTAssertEqual(invokedMultiplicationCountParameters.numberTwo, "")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedDivision)
        XCTAssertFalse(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorInteractorSpy.invokedSum)
    }
    
    func testHasRequiredNumbersAndMultiplicationIsRequestedShouldSuccess() throws {
        sut.numberOneTextField.text = "10"
        sut.numberTwoTextField.text = "5"
        
        sut.onMultiplicationButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedMultiplication)
        XCTAssertEqual(calculatorInteractorSpy.invokedMultiplicationCount, 1)
        
        let invokedMultiplicationCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedMultiplicationParameters)
        
        XCTAssertEqual(invokedMultiplicationCountParameters.numberOne, "10")
        XCTAssertEqual(invokedMultiplicationCountParameters.numberTwo, "5")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedDivision)
        XCTAssertFalse(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorInteractorSpy.invokedSum)
    }
    
    // MARK: DivisionTests
    func testHasNoGivenNumbersAndDivisionIsRequestedShouldError() throws {
        sut.onDivisionButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedDivision)
        XCTAssertEqual(calculatorInteractorSpy.invokedDivisionCount, 1)
        
        let invokedDivisionCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedDivisionParameters)
        
        XCTAssertEqual(invokedDivisionCountParameters.numberOne, "")
        XCTAssertEqual(invokedDivisionCountParameters.numberTwo, "")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedSum)
        XCTAssertFalse(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorInteractorSpy.invokedMultiplication)
    }
    
    func testHasRequiredNumbersAndDivisionIsRequestedShouldSuccess() throws {
        sut.numberOneTextField.text = "10"
        sut.numberTwoTextField.text = "5"
        
        sut.onDivisionButtonTapped()
        
        XCTAssertTrue(calculatorInteractorSpy.invokedDivision)
        XCTAssertEqual(calculatorInteractorSpy.invokedDivisionCount, 1)
        
        let invokedDivisionCountParameters = try XCTUnwrap(calculatorInteractorSpy.invokedDivisionParameters)
        
        XCTAssertEqual(invokedDivisionCountParameters.numberOne, "10")
        XCTAssertEqual(invokedDivisionCountParameters.numberTwo, "5")
        
        XCTAssertFalse(calculatorInteractorSpy.invokedSum)
        XCTAssertFalse(calculatorInteractorSpy.invokedSubtraction)
        XCTAssertFalse(calculatorInteractorSpy.invokedMultiplication)
    }
}
