//
//  AvailableBalanceView.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import SwiftUI

struct AvailableBalanceView: View {
    
    @EnvironmentObject private var bankService: BankService
    
    var body: some View {
        Text("\(bankService.balance.formatAsCurrency())")
            .task {
                try? await bankService.getCurrentBalance()
            }
    }
}

struct AvailableBalanceView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableBalanceView()
    }
}
