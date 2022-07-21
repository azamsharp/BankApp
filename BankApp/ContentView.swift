//
//  ContentView.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Form {
                Section {
                    AvailableBalanceView()
                } header: {
                    Text("AVAILABLE BALANCE")
                }
                
                Section {
                    DepositView()
                } header: {
                    Text("DEPOSIT")
                }
                
                Section {
                    WithdrawView()
                } header: {
                    Text("WITHDRAW")
                }

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(BankService())
    }
}
