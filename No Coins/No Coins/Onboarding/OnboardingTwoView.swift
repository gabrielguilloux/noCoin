//
//  OnboardingTwoView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 31/08/2025.
//

import SwiftUI

struct OnboardingTwoView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "person.3.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
            Spacer()
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: -8) {
                        Text("CHOOSE YOUR")
                            .font(.largeTitle)
                            .foregroundStyle(Color.fg1)
                        Text("PLAYERS")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(Color.primaryOrange)
                    }
                    Spacer()
                }
                VStack(spacing: 8) {
                    PaywallArgument(text: "Up to 8 players", image: "person.crop.circle.fill.badge.plus")
                    PaywallArgument(text: "Name everyone", image: "square.and.pencil.circle.fill")
                    PaywallArgument(text: "Keep track of virtual chips", image: "centsign.circle.fill")
                }
            }
        }
        .padding(24)
        .containerRelativeFrame(.horizontal)
    }
}

#Preview {
    OnboardingTwoView()
}
