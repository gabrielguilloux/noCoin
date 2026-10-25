//
//  ContentView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerNumber: Int = 2
    @State private var selectedCoin: Int? = nil
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("NO COINS")
                        .font(Font.custom("Tallica", size: 72))
                        .baselineOffset(-20)
                }
                .frame(height: 100)
                
                Spacer()
                if selectedCoin != nil {
                    NavigationLink {
                        GameView()
                            .environmentObject(gameViewModel)
                    } label: {
                        VStack {
                            Text("Start")
                                .font(.system(size: 24))
                                .bold()
                                .foregroundStyle(Color.fg1)
                        }
                        .frame(width: 300, height: 48)
                        .padding(.vertical, 10)
                        .background(Color.primaryOrange)
                        .cornerRadius(30)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            if let startingCoins = selectedCoin {
                                gameViewModel.setupNewGame(
                                    playerCount: playerNumber,
                                    startingCoins: startingCoins
                                )
                            }
                        }
                    )
                }
                Spacer()
                
                HStack {
                    Text("Players:")
                    
                    Picker("Players", selection: $playerNumber) {
                        ForEach(2...8, id: \.self) { index in
                            Text("\(index)")
                                .bold()
                                .foregroundStyle(Color.primaryOrange)
                                .tag(index)
                        }
                    }
                    .frame(height: 100)
                    .pickerStyle(.wheel)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(Color.bg1)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.bg2)
                )
                
                VStack(spacing: 10) {
                    HStack {
                        CoinSelector(coinNumber: 100, selectedCoin: $selectedCoin)
                        CoinSelector(coinNumber: 200, selectedCoin: $selectedCoin)
                    }
                    HStack {
                        CoinSelector(coinNumber: 500, selectedCoin: $selectedCoin)
                        CoinSelector(coinNumber: 1000, selectedCoin: $selectedCoin)
                    }
                    
                }
                
            }
            .padding()
        }
        .tint(Color.fg1)
        .background(Color.bg0)
    }
}

#Preview {
    ContentView()
}
