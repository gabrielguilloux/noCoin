//
//  BetView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

struct BetView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    let coinBet: Int
    let playerId: UUID
    let player: Player
    
    var body: some View {
        if coinBet > player.coins || gameViewModel.receivedPart {
            Button {
                
            } label: {
                HStack {
                    Text("\(coinBet)")
                        .foregroundColor(.bg3)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.bg2)
                .cornerRadius(10)
            }
        } else {
            Button {
                gameViewModel.updatePlayerBetInGame(playerId: playerId, bet: coinBet)
                gameViewModel.removeCoinsFromPlayer(playerId: playerId, amount: coinBet)
                gameViewModel.potAmount += coinBet
            } label: {
                HStack {
                    Text("\(coinBet)")
                        .foregroundColor(.fg1)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.bg2)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.bg3)
                )
            }
        }
    }
}
//#Preview {
//    BetView(coinNumber: 1)
//}
