//
//  GameView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    @State private var selectedBet: Int? = nil
    @State private var selectedPlayer: Int? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            PotView()
            ScrollView {
                VStack {
                    ForEach(gameViewModel.players) { player in
                        PlayerSummary(
                            player: player,
                            selectedPlayer: $selectedPlayer,
                            selectedBet: $selectedBet
                        )
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
        }
        .ignoresSafeArea()
        
        
        
    }
}

#Preview {
    GameView()
}
