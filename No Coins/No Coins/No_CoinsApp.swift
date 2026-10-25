//
//  No_CoinsApp.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

@main
struct No_CoinsApp: App {
    
    @AppStorage("isWelcomeScreenOver") var isWelcomeScreenOver = false
    
    var body: some Scene {
        WindowGroup {
            if isWelcomeScreenOver {
                ContentView()
            } else {
                OnboardingView()
            }
        }
    }
}
