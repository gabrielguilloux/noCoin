//
//  PlayerSummary.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

struct PlayerSummary: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    let player: Player
    @Binding var selectedPlayer: Int?
    @Binding var selectedBet: Int?
    @State private var tempName = ""
    @State private var showingPartSheet = false
    @State private var selectedAmount = 0
    
    var body: some View {
        Button {
            selectedPlayer = selectedPlayer == player.index ? nil : player.index
        } label: {
            VStack(spacing: 10) {
                HStack {
                    if selectedPlayer == player.index {
                        TextField("Player name", text: $tempName)
                            .font(.system(size: 24))
                            .multilineTextAlignment(.leading)
                            .onSubmit {
                                gameViewModel.updatePlayerName(playerId: player.id, newName: tempName)
                            }
                            .onAppear {
                                tempName = player.name
                            }
                    } else {
                        Text(player.name)
                            .font(.system(size: 24))
                            .foregroundStyle(Color.fg1)
                    }
                    
                    Spacer()
                    if player.coinInGame > 0 {
                        Text("\(player.coinInGame)")
                            .foregroundStyle(Color.primaryBlue)
                            .bold()
                    }
                    
                    Text("\(player.coins)") // Direct access to player coins
                        .font(Font.custom("Tallica", size: 36))
                        .foregroundStyle(Color.fg1)
                }
                if selectedPlayer == player.index {
                    HStack {
                        BetView(
                            coinBet: 1,
                            playerId: player.id,
                            player: player
                        )
                        BetView(
                            coinBet: 5,
                            playerId: player.id,
                            player: player
                        )
                        BetView(
                            coinBet: 20,
                            playerId: player.id,
                            player: player
                        )
                        BetView(
                            coinBet: 50,
                            playerId: player.id,
                            player: player
                        )
                    }
                    HStack {
                        if gameViewModel.receivedPart {
                            Button {
                                
                            } label: {
                                HStack{
                                    Image(systemName: "xmark.circle")
                                        .foregroundStyle(Color.bg3)
                                    Text("Cancel bet")
                                        .foregroundStyle(Color.bg3)
                                }
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color.bg2)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.bg3)
                                )
                            }
                        } else {
                            Button {
                                gameViewModel.cancelPlayerBetInGame(playerId: player.id)
                            } label: {
                                HStack{
                                    Image(systemName: "xmark.circle")
                                        .foregroundStyle(Color.fg1)
                                    Text("Cancel bet")
                                        .foregroundStyle(Color.fg1)
                                }
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color.bg2)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.bg3)
                                )
                            }
                        }
                        if gameViewModel.receivedPart {
                            Button {
                                
                            } label: {
                                HStack{
                                    Text("All In")
                                        .foregroundStyle(Color.bg3)
                                }
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color.bg2)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.bg3)
                                )
                            }
                        } else {
                            Button {
                                gameViewModel.updatePlayerBetInGame(playerId: player.id, bet: player.coins)
                                
                                gameViewModel.removeCoinsFromPlayer(playerId: player.id, amount: player.coins)
                                gameViewModel.potAmount += player.coins
                            } label: {
                                HStack{
                                    Text("All In")
                                        .foregroundStyle(Color.fg1)
                                }
                                .padding(.vertical, 20)
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
                    
                    HStack {
                        Button {
                            selectedAmount = min(gameViewModel.potAmount, gameViewModel.potAmount)
                            showingPartSheet = true
                        } label: {
                            HStack{
                                Image(systemName: "square.and.arrow.down")
                                    .foregroundStyle(Color.fg1)
                                Text("Receive part")
                                    .foregroundStyle(Color.fg1)
                            }
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.bg2)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.secondaryOrange)
                            )
                        }
                        
                        Button {
                            gameViewModel.playerReceivesPot(playerId: player.id)
                        } label: {
                            HStack{
                                Image(systemName: "square.and.arrow.down")
                                    .foregroundStyle(Color.fg1)
                                Text("Receive Pot")
                                    .foregroundStyle(Color.fg1)
                            }
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.bg2)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.secondaryBlue)
                            )
                        }
                        
                    }
                    
                }
            }
            .padding(20)
            .background(Color.bg1)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedPlayer == player.index ? Color.primaryOrange : Color.bg2)
            )
        }
        .sheet(isPresented: $showingPartSheet) {
            ReceivePartSheet(
                player: player,
                selectedAmount: $selectedAmount,
                maxAmount: gameViewModel.potAmount
            ) { amount in
                gameViewModel.playerReceivesPart(playerId: player.id, amount: amount)
                showingPartSheet = false
            }
            .presentationDetents([.medium])
        }
    }
}

//#Preview {
//    PlayerSummary(playerName: "Player 1", coinNumber: 147)
//}
