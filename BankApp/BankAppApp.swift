//
//  BankAppApp.swift
//  BankApp
//
//  Created by Mohammad Azam on 7/21/22.
//

import SwiftUI

@main
struct BankAppApp: App {
    
    @StateObject private var bankService = BankService()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(bankService)
        }
    }
}
