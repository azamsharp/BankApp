//
//  DepositView.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import SwiftUI

struct DepositView: View {
    
    @EnvironmentObject var bankService: BankService
    
    @State private var depositAmount: String = ""
    @State private var errorMessage: String = ""
    
    private func isValid(_ amount: Double) -> Bool {
        
        if amount > 500 {
            errorMessage = "Amount over $500 is not allowed!"
            return false
        }
        
        if amount < 0 {
            errorMessage = "At least $1 is required for deposit"
            return false
        }
        
        errorMessage = ""
        return true
        
    }
    
    private func deposit() async {
        
        guard let amount = Double(depositAmount) else {
                   return
        }
        
        if isValid(amount) {
            // send to the server
            do {
                try await bankService.deposit(amount)
            } catch BankError.custom(let message) {
                errorMessage = message
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
                  TextField("Enter amount", text: $depositAmount)
                  Text("Amount over $500 not allowed!")
                      .font(.caption)
                      .opacity(0.4)
                  Button("Deposit") {
                      Task {
                          await deposit()
                      }
                  }.buttonStyle(.borderedProminent)
                  
                  Text(errorMessage)
              }
    }
}

struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView()
    }
}
