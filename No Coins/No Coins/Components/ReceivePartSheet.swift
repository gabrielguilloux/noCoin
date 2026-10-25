//
//  ReceivePartSheet.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 22/08/2025.
//

import SwiftUI

struct ReceivePartSheet: View {
    let player: Player
    @Binding var selectedAmount: Int
    let maxAmount: Int
    let onConfirm: (Int) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Text("\(player.name)")
                        .font(.title2)
                        .bold()
                    
                    Text("Select amount to receive from pot")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
//                VStack(spacing: 20) {
//                    Text("Pot Amount: \(maxAmount)")
//                        .font(.headline)
//                }
                
                Picker("Amount", selection: $selectedAmount) {
                    ForEach(0...maxAmount, id: \.self) { amount in
                        Text("\(amount)")
                            .tag(amount)
                    }
                }
                .pickerStyle(.wheel)
                .frame(maxHeight: .infinity)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    Button("Confirm") {
                        onConfirm(selectedAmount)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(selectedAmount == 0)
                }
                .padding(.bottom, 20)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
