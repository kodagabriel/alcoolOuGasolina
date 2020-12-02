//
//  ViewController.swift
//  alcoolOuGasolina
//
//  Created by Usemobile Tecnologia on 02/12/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Outlets
    
    
    @IBOutlet weak var alcoolTextField: UITextField!
    
    @IBOutlet weak var gasolinaTextField: UITextField!
    
    @IBOutlet weak var resultadoTextField: UILabel!
    
    // MARK: - ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTextFields()
    }
    
    
    // MARK: - Functions
    
    func configuraTextFields() {
        inserePrefixoTextField(gasolinaTextField)
        inserePrefixoTextField(alcoolTextField)
        alcoolTextField.delegate = self
        gasolinaTextField.delegate = self
    }
    
    func inserePrefixoTextField(_ textField: UITextField) {
        let prefix = UILabel()
        prefix.text = "R$"
        prefix.sizeToFit()
        textField.leftView = prefix
        textField.leftViewMode = .always
    }
    
    func decideMelhorCompra() {
        guard let precoAlcool = Double(alcoolTextField.text!) else {return}
        guard let precoGasolina = Double(gasolinaTextField.text!) else {return}
        
        let porcentagem = precoAlcool / precoGasolina
        
        if porcentagem < 0.7 {
            resultadoTextField.text = "É melhor abastecer com álcool"
        } else {
            resultadoTextField.text = "É melhor abastecer com gasolina"
        }
        
    }
    
    func checaPreenchimentoCampos() -> Bool {
        guard let precoAlcool = alcoolTextField.text else {return false}
        guard let precoGasolina = gasolinaTextField.text else {return false}
        if precoAlcool.isEmpty || precoGasolina.isEmpty {
            resultadoTextField.text = "Digite valores para calcular"
            return false
        }
        if precoAlcool == "0" || precoGasolina == "0" {
            resultadoTextField.text = "Preço não pode ser 0"
            return false
        }
        return true
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if checaPreenchimentoCampos() {
            decideMelhorCompra()
        }
        self.view.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if checaPreenchimentoCampos() {
            decideMelhorCompra()
        }
    }
    
    
    


}

