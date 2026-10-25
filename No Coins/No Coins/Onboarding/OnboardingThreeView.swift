//
//  OnboardingThreeView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 31/08/2025.
//

import SwiftUI

struct OnboardingThreeView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("coin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 144)
            Spacer()
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: -8) {
                        Text("CHOOSE THE")
                            .font(.largeTitle)
                            .foregroundStyle(Color.fg1)
                        Text("COINS AMOUNT")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.primaryOrange)
                    }
                    Spacer()
                }
                VStack(spacing: 8) {
                    PaywallArgument(text: "Digital Poker Chip Set", image: "play.circle.fill")
                    PaywallArgument(text: "Simple, intuitive interface", image: "square.and.pencil.circle.fill")
                    PaywallArgument(text: "Up to 8 players", image: "person.circle.fill")
                }
            }
        }
        .padding(24)
        .containerRelativeFrame(.horizontal)
    }
}

#Preview {
    OnboardingThreeView()
}
