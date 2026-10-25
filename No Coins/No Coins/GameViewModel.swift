//
//  GameViewModel.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 21/08/2025.
//

import Foundation

struct Player: Identifiable, Codable {
    var id = UUID()
    var name: String
    var coins: Int
    var index: Int
    var coinInGame: Int
    
    init(name: String, coins: Int, index: Int, coinInGame: Int) {
        self.name = name
        self.coins = coins
        self.index = index
        self.coinInGame = coinInGame
    }
}

class GameViewModel: ObservableObject {
    @Published var players: [Player] = []
    @Published var maxPlayers: Int = 8
    @Published var baseCoins: Int = 200
    @Published var potAmount: Int = 0
    @Published var receivedPart: Bool = false
    
    
    func addPlayer(name: String = "", startingCoins: Int = 0) {
        guard players.count < maxPlayers else { return }
        
        let playerName = name.isEmpty ? "Player \(players.count + 1)" : name
        let newPlayer = Player(name: playerName, coins: startingCoins, index: players.count, coinInGame: 0)
        players.append(newPlayer)
    }
    
    func setupNewGame(playerCount: Int, startingCoins: Int = 0) {
        players.removeAll()
        potAmount = 0
        
        for i in 1...min(playerCount, maxPlayers) {
            addPlayer(name: "Player \(i)", startingCoins: startingCoins)
        }
        receivedPart = false
    }
    
    func updatePlayerCoins(playerId: UUID, newCoins: Int) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].coins = max(0, newCoins)
        }
    }
    
    func addCoinsToPlayer(playerId: UUID, amount: Int) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].coins += amount
        }
    }
    
    func removeCoinsFromPlayer(playerId: UUID, amount: Int) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].coins = max(0, players[index].coins - amount)
        }
    }
    
    func updatePlayerBetInGame(playerId: UUID, bet: Int) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].coinInGame += bet
        }
    }
    
    func cancelPlayerBetInGame(playerId: UUID) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].coins += players[index].coinInGame
            potAmount -= players[index].coinInGame
            players[index].coinInGame = 0
        }
    }
    
    func updatePlayerName(playerId: UUID, newName: String) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].name = newName.isEmpty ? "Player \(index + 1)" : newName
        }
    }
    
    func playerReceivesPot(playerId: UUID) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            players[index].coins += potAmount
            potAmount = 0
            
            for i in players.indices {
                players[i].coinInGame = 0
            }
            
            receivedPart = false
        }
    }
    
    func playerReceivesPart(playerId: UUID, amount: Int) {
        if let index = players.firstIndex(where: { $0.id == playerId }) {
            let actualAmount = min(amount, potAmount)
            players[index].coins += actualAmount
            potAmount -= actualAmount
            receivedPart = true
            
//            players[index].coinInGame -= actualAmount
            if potAmount == 0 {
                for i in players.indices {
                    players[i].coinInGame = 0
                }
                receivedPart = false
            }
        }
    }
    
}


