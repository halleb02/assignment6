//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Halle Paulk on 2/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountUSDTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var switchEuros: UISwitch!
    @IBOutlet weak var switchYen: UISwitch!
    @IBOutlet weak var switchPesos: UISwitch!
    @IBOutlet weak var switchWon: UISwitch!
    
    var converterLogic = CurrencyConverterLogic()
    var switchStates: [String: Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountUSDTextField.delegate = self
        errorLabel.isHidden = true
        
        configureSwitches() // Configure switches
    }
    
    func configureSwitches() {
        
        switchEuros.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        switchYen.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        switchPesos.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        switchWon.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountText = amountUSDTextField.text,
              let amount = Int(amountText) else {
            showError(message: "Integers only!")
            return
        }
        
        errorLabel.isHidden = true
        
        performSegue(withIdentifier: "showConversion", sender: amount)
    }
    
    func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConversion",
           let destinationVC = segue.destination as? ConversionViewController,
           let amountUSD = sender as? Int {
            destinationVC.amountUSD = amountUSD
            destinationVC.converterLogic = self.converterLogic // Pass the CurrencyConverterLogic instance
            destinationVC.switchStates = getSwitchStates()
        }
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        switch sender {
        case switchEuros:
            switchStates["Euros (EUR)"] = sender.isOn
        case switchYen:
            switchStates["Yen (JPY)"] = sender.isOn
        case switchPesos:
            switchStates["Pesos (MXN)"] = sender.isOn
        case switchWon:
            switchStates["Won (KRW)"] = sender.isOn
        default:
            break
        }
    }

    func getSwitchStates() -> [String: Bool] {
        var switchStates: [String: Bool] = [:]
        switchStates["Euros (EUR)"] = switchEuros.isOn
        switchStates["Yen (JPY)"] = switchYen.isOn
        switchStates["Pesos (MXN)"] = switchPesos.isOn
        switchStates["Won (KRW)"] = switchWon.isOn
        return switchStates
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else {
            return true
        }
        
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        let stringCharacterSet = CharacterSet(charactersIn: text)
        let isValidInput = allowedCharacterSet.isSuperset(of: stringCharacterSet)
        
        if !isValidInput {
            showError(message: "Integers only!")
            return false
        } else {
            errorLabel.isHidden = true
            return true
        }
    }
}
