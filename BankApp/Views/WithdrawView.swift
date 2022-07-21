//
//  WithdrawView.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import SwiftUI

struct WithdrawView: View {
    
    @EnvironmentObject var bankService: BankService
    @State private var withdrawAmount: String = ""
    @State private var errorMessage: String = ""
    
    private func isValid(_ amount: Double) -> Bool {
        
        if amount < 1 {
            errorMessage = "Minimum withdrawal is $1"
            return false
        }
        
        else if amount > 200 {
            errorMessage = "Maximum withdrawal is $200"
            return false
        }
        
        errorMessage = ""
        return true
        
    }
    
    private func withdraw() async {
        
        guard let amount = Double(withdrawAmount) else {
                  return
        }
        
        if isValid(amount) {
            do {
                try await bankService.withdraw(amount)
            } catch BankError.custom(let message) {
                errorMessage = message
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Withdraw amount", text: $withdrawAmount)
            Text("Minimum withdraw $1 - Maximum withdraw $200")
                .font(.caption)
                .opacity(0.4)
            Button("Withdraw") {
                Task {
                    await withdraw()
                }
            }.buttonStyle(.borderedProminent)
            
            Text(errorMessage)
        }
    }
}

struct WithdrawView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawView()
    }
}
