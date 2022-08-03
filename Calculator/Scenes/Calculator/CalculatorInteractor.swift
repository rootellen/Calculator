//
//  CalculatorInteractor.swift
//  CalculatorUnitTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

protocol CalculatorInteractorProtocol {
    func sum(numberOne: String?, numberTwo: String?)
    func subtraction(numberOne: String?, numberTwo: String?)
    func multiplication(numberOne: String?, numberTwo: String?)
    func division(numberOne: String?, numberTwo: String?)
}

final class CalculatorInteractor: CalculatorInteractorProtocol {
    
    private let calculator: CalculatorWorkerProtocol
    private let presenter: CalculatorPresenterProtocol
    
    init(calculator: CalculatorWorkerProtocol, presenter: CalculatorPresenterProtocol) {
        self.calculator = calculator
        self.presenter = presenter
    }
    
    func sum(numberOne: String?, numberTwo: String?) {
        validNumbers(numberOne: numberOne, numberTwo: numberTwo) { numberOneFloat, numberTwoFloat in
            let result = calculator.sum(num1: numberOneFloat, num2: numberTwoFloat)
            
            presenter.present(operation: .sum, result: result)
        }
    }
    
    func subtraction(numberOne: String?, numberTwo: String?) {
        validNumbers(numberOne: numberOne, numberTwo: numberTwo) { numberOneFloat, numberTwoFloat in
            let result = calculator.subtraction(num1: numberOneFloat, num2: numberTwoFloat)
            
            presenter.present(operation: .sum, result: result)
        }
    }
    
    func multiplication(numberOne: String?, numberTwo: String?) {
        validNumbers(numberOne: numberOne, numberTwo: numberTwo) { numberOneFloat, numberTwoFloat in
            let result = calculator.multiplication(num1: numberOneFloat, num2: numberTwoFloat)
            
            presenter.present(operation: .sum, result: result)
        }
    }
    
    func division(numberOne: String?, numberTwo: String?) {
        validNumbers(numberOne: numberOne, numberTwo: numberTwo) { numberOneFloat, numberTwoFloat in
            let result = calculator.division(num1: numberOneFloat, num2: numberTwoFloat)
            
            presenter.present(operation: .sum, result: result)
        }
    }
    
    private func validNumbers(numberOne: String?, numberTwo: String?, then operate: (Float, Float) -> ()) {
        if let numberOneString = numberOne, let numberOneFloat = Float(numberOneString), let numberTwoString = numberTwo, let numberTwoFloat = Float(numberTwoString) {
            operate(numberOneFloat, numberTwoFloat)
        } else {
            presenter.presentInvalidNumberError()
        }
    }
}
