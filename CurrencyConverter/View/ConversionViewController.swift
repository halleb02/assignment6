
//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Halle Paulk on 2/12/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet weak var amountUSDLabel: UILabel!
    @IBOutlet weak var convertedCurrenciesStackView: UIStackView!
    @IBOutlet weak var backButton: UIButton!
    
    var amountUSD: Int = 0
    var converterLogic = CurrencyConverterLogic()
    var switchStates: [String: Bool] = [:] // Store switch states
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        amountUSDLabel.text = "Amount in USD: \(amountUSD)"
        
        // Define selected currencies
        let selectedCurrencies = ["Euros (EUR)", "Yen (JPY)", "Pesos (MXN)", "Won (KRW)"]
        
        // Call convertAmount function with correct parameters
        let convertedCurrencies = converterLogic.convertAmount(amountUSD, to: selectedCurrencies, withSwitchStates: switchStates)
        
        // Clear the stack view before adding new labels
        convertedCurrenciesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // Add labels for each converted currency
        for currency in convertedCurrencies {
            let currencyLabel = UILabel()
            currencyLabel.text = "\(currency.name): \(currency.convertedAmount)"
            convertedCurrenciesStackView.addArrangedSubview(currencyLabel)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
