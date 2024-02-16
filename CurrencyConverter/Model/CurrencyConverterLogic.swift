//
//  CurrencyConverterLogic.swift
//  CurrencyConverter
//
//  Created by Halle Paulk on 2/12/24.
//

import Foundation

struct CurrencyConverterLogic {
    
    var currencySwitches: [Bool] = [true, true, true, true] // Switch states for currencies    
    let exchangeRates: [String: Double] = [
        "Euros (EUR)": 0.93,
        "Yen (JPY)": 150.34,
        "Pesos (MXN)": 17.06,
        "Won (KRW)": 1333.86
    ]
    
    mutating func setSwitch(_ switchValue: Bool, for currency: Int) {
        guard currency >= 1 && currency <= 4 else {
            return
        }
        currencySwitches[currency - 1] = switchValue
    }
    
    
    func convertAmount(_ amountUSD: Int, to selectedCurrencies: [String], withSwitchStates switchStates: [String: Bool]) -> [Currency] {
        var convertedCurrencies: [Currency] = []
        
        for currencyName in selectedCurrencies {
            guard let exchangeRate = exchangeRates[currencyName], switchStates[currencyName] ?? false else {
                continue // Skip conversion if the switch is off or currency not selected
            }
            let convertedAmount = Int(Double(amountUSD) * exchangeRate)
            let currency = Currency(name: currencyName, convertedAmount: convertedAmount)
            convertedCurrencies.append(currency)
        }
        
        return convertedCurrencies
    }

    
}
