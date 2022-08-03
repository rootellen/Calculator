//
//  CalculatorPresenter.swift
//  CalculatorUnitTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

enum CalculatorPresenterOperation {
    case sum, subtract, multiplication, division
}

protocol CalculatorPresenterProtocol: AnyObject {
    func present(operation: CalculatorPresenterOperation, result: Float)
    func presentInvalidNumberError()
}

final class CalculatorPresenter: CalculatorPresenterProtocol {
    weak var display: CalculatorDisplayProtocol?
    
    func present(operation: CalculatorPresenterOperation, result: Float) {
        let operationText: String
        
        switch operation {
            case .sum:
                operationText = "soma"
            case .subtract:
                operationText = "subtração"
            case .multiplication:
                operationText = "multiplicação"
            case .division:
                operationText = "divisão"
        }
        
        let viewModel = CalculatorViewModel(
            text: "O resultado da \(operationText) é: \(result)", textColor: .systemGreen
        )
        
        display?.display(viewModel: viewModel)
    }
    
    func presentInvalidNumberError() {
        let viewModel = CalculatorViewModel(
            text: "Verifique os valores informados.", textColor: .systemRed
        )
        
        display?.display(viewModel: viewModel)
    }
    
    
}
