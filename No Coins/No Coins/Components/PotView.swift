//
//  PotView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

struct PotView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("Pot")
            Text("\(gameViewModel.potAmount)")
                .font(Font.custom("Tallica", size: 36))
                .foregroundStyle(Color.fg1)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .background(Color.primaryOrange)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.bg2)
        )
        
    }
}

#Preview {
    PotView()
}
