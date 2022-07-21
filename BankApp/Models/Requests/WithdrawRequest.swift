//
//  WithdrawRequest.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import Foundation

struct WithdrawRequest: Encodable {
    let accountNumber: String
    let amount: Double
}
