//
//  BankService.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import Foundation

enum BankError: Error {
    case custom(String)
}

@MainActor
class BankService: ObservableObject {
    
    @Published var balance: Double = 0.0
    
    func getCurrentBalance() async throws {
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://island-bramble.glitch.me/api/1/current-balance")!)
        
        let currentBalanceResponse = try JSONDecoder().decode(CurrentBalanceResponse.self, from: data)
        if currentBalanceResponse.success {
            if let balance = currentBalanceResponse.balance {
                self.balance = balance
            }
        } else {
            throw BankError.custom(currentBalanceResponse.message ?? "")
        }
        
    }
    
    func deposit(_ amount: Double) async throws {
        
        let depositRequest = DepositRequest(accountNumber: "1", amount: amount)
        
        var request = URLRequest(url: URL(string: "https://island-bramble.glitch.me/api/deposit")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(depositRequest)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _ ) = try await URLSession.shared.data(for: request)
        
        let depositResponse = try JSONDecoder().decode(DepositResponse.self, from: data)
        
        if depositResponse.success {
            if let balance = depositResponse.balance {
                self.balance = balance
            }
        } else {
            throw BankError.custom(depositResponse.message ?? "")
        }
    }
    
    
    func withdraw(_ amount: Double) async throws {
           
           let withdrawRequest = WithdrawRequest(accountNumber: "1", amount: amount)
           
           var request = URLRequest(url: URL(string: "https://island-bramble.glitch.me/api/withdraw")!)
           request.httpMethod = "POST"
           request.httpBody = try? JSONEncoder().encode(withdrawRequest)
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
           let (data, _ ) = try await URLSession.shared.data(for: request)
           
           let withdrawResponse = try JSONDecoder().decode(WithdrawResponse.self, from: data)
           
           if withdrawResponse.success {
               if let balance = withdrawResponse.balance {
                   self.balance = balance
               }
           } else {
               throw BankError.custom(withdrawResponse.message ?? "")
           }
       }
    
    
    
}


