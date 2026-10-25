//
//  CoinSelector.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

struct CoinSelector: View {
    
    var coinNumber: Int
    @Binding var selectedCoin: Int?
    
    var body: some View {
        
        Button {
            selectedCoin = selectedCoin == coinNumber ? nil : coinNumber
        } label: {
            VStack {
                Text("\(coinNumber)")
                    .font(Font.custom("Tallica", size: 36))
                    .foregroundStyle(Color.fg1)
                Text("coins")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.fg1)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color.bg1)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedCoin == coinNumber ? Color.primaryOrange : Color.bg2)
            )
        }
    }
}

//#Preview {
//    CoinSelector(coinNumber: 200, selectedCoin: 1)
//}
