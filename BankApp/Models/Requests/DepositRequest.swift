//
//  DepositRequest.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import Foundation

struct DepositRequest: Encodable {
    let accountNumber: String
    let amount: Double
}
