//
//  OnboardingOneView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 31/08/2025.
//

import SwiftUI

struct OnboardingOneView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: -8) {
                        VStack {
                            Text("NO COINS")
                                .font(Font.custom("Tallica", size: 72))
                                .baselineOffset(-20)
                        }
                        .frame(height: 120)
                        .foregroundStyle(Color.white)
                        Text("Poker chips")
                            .font(.system(size: 36))
                            .foregroundStyle(Color.primaryOrange)
                    }
                    Spacer()
                }
                VStack(spacing: 8) {
                    PaywallArgument(text: "Digital Poker Chip Set", image: "play.circle.fill")
                    PaywallArgument(text: "Simple, intuitive interface", image: "square.and.pencil.circle.fill")
                    PaywallArgument(text: "Play with friends and family", image: "person.circle.fill")
                }
            }
        }
        .padding(24)
        .containerRelativeFrame(.horizontal)
    }
}

#Preview {
    OnboardingOneView()
}
