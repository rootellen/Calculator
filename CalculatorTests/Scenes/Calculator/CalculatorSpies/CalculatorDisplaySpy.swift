//
//  CalculatorDisplauSpy.swift
//  CalculatorTests
//
//  Created by Ruth Ellen da Silva on 02/08/22.
//

import Foundation
@testable import Calculator

final class CalculatorDisplaySpy: CalculatorDisplayProtocol {

    var invokedDisplay = false
    var invokedDisplayCount = 0
    var invokedDisplayParameters: (viewModel: CalculatorViewModel, Void)?
    var invokedDisplayParametersList = [(viewModel: CalculatorViewModel, Void)]()

    func display(viewModel: CalculatorViewModel) {
        invokedDisplay = true
        invokedDisplayCount += 1
        invokedDisplayParameters = (viewModel, ())
        invokedDisplayParametersList.append((viewModel, ()))
    }
}
