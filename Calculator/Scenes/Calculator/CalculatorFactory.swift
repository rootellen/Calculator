//
//  CalculatorFactory.swift
//  CalculatorUnitTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

final class CalculatorFactory {
    func initClasses() -> CalculatorViewController {
        let vc = CalculatorViewController()
        let presenter = CalculatorPresenter()
        presenter.display = vc
        let interactor = CalculatorInteractor(calculator: CalculatorWorker(), presenter: presenter)
        vc.interactor = interactor
        
        return vc
    }
}
