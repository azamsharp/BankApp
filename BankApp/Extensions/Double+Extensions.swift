//
//  Double+Extensions.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(floatLiteral: self)) ?? ""
    }
    
}
