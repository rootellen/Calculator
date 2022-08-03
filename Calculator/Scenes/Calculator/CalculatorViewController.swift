//
//  ViewController.swift
//  CalculatorUnitTests
//
//  Created by Ruth Ellen da Silva on 01/08/22.
//

import UIKit

struct CalculatorViewModel {
    let text: String
    let textColor: UIColor
}

protocol CalculatorDisplayProtocol: AnyObject {
    func display(viewModel: CalculatorViewModel)
}

class CalculatorViewController: UIViewController, CalculatorDisplayProtocol {
    
    //viewCode
    let numberOneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Informe o primeiro valor"
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    let numberTwoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Informe o segundo valor"
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    private let sumButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("➕", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        button.addTarget(self, action: #selector(onSumButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let subtractionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("➖", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        button.addTarget(self, action: #selector(onSubtractionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let multiplicationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("✖️", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        button.addTarget(self, action: #selector(onMultiplicationButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let divisionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("➗", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        button.addTarget(self, action: #selector(onDivisionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sumButton, subtractionButton, multiplicationButton, divisionButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [numberOneTextField, numberTwoTextField, buttonStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    var interactor: CalculatorInteractorProtocol?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onSumButtonTapped() {
        interactor?.sum(numberOne: numberOneTextField.text, numberTwo: numberTwoTextField.text)
    }
    
    @objc func onSubtractionButtonTapped() {
        interactor?.subtraction(numberOne: numberOneTextField.text, numberTwo: numberTwoTextField.text)
    }
    
    @objc func onMultiplicationButtonTapped() {
        interactor?.multiplication(numberOne: numberOneTextField.text, numberTwo: numberTwoTextField.text)
    }
    
    @objc func onDivisionButtonTapped() {
        interactor?.division(numberOne: numberOneTextField.text, numberTwo: numberTwoTextField.text)
    }
    
    func display(viewModel: CalculatorViewModel) {
        resultLabel.text = viewModel.text
        resultLabel.textColor = viewModel.textColor
        resultLabel.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Calculadora"
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(resultLabel)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

}
