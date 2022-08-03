//
//  CalculatorUnitTestsTests.swift
//  CalculatorUnitTestsTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    private var sut: CalculatorWorker!
    
    override func setUp() {
        super.setUp()
        
        sut = CalculatorWorker()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSum() {
        let givenResult = sut.sum(num1: 10.0, num2: 5.0)
        let expectedResult: Float = 15
        
        XCTAssertEqual(givenResult, expectedResult)
    }
    
    func testSubtraction() {
        let givenResult = sut.subtraction(num1: 10.0, num2: 5.0)
        let expectedResult: Float = 5
        
        XCTAssertEqual(givenResult, expectedResult)
    }
    
    func testMultiplication() {
        let givenResult = sut.multiplication(num1: 10.0, num2: 5.0)
        let expectedResult: Float = 50
        
        XCTAssertEqual(givenResult, expectedResult)
    }
    
    func testDivision() {
        let givenResult = sut.division(num1: 10.0, num2: 5.0)
        let expectedResult: Float = 2
        
        XCTAssertEqual(givenResult, expectedResult)
    }

}
