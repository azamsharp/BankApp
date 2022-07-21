//
//  CurrentBalanceResponse.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import Foundation

struct CurrentBalanceResponse: Decodable {
    let success: Bool
    let balance: Double?
    let message: String?
}
