//
//  WithdrawResponse.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import Foundation

struct WithdrawResponse: Decodable {
    let success: Bool
    let balance: Double?
    let message: String?
}
