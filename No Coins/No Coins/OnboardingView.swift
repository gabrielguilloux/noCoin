//
//  OnboardingView.swift
//  No Coins
//
//  Created by Gabriel Guilloux on 31/08/2025.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isWelcomeScreenOver") var isWelcomeScreenOver = false
    @State private var currentPage: Int = 0
    private let maxPages: Int = 3
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 24) {
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 96) {
                            OnboardingOneView()
                                .id(0)
                            OnboardingTwoView()
                                .id(1)
                            OnboardingThreeView()
                                .id(2)
                        }
                        .scrollTargetLayout()
                    }
                    .scrollDisabled(true)
                    .contentMargins([.horizontal, .bottom], 24, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                    .onChange(of: currentPage) { _, newPage in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            proxy.scrollTo(newPage, anchor: .center)
                        }
                    }
                }
                
                if currentPage < maxPages - 1 {
                    Button {
                        currentPage += 1
                    } label: {
                        PaywallButton(text: "Continue")
                    }
                } else {
                    Button {
                        isWelcomeScreenOver = true
                    } label: {
                        PaywallButton(text: "Let's play!")
                    }
                }
                if currentPage < maxPages {
                    PaywallPagination(maxPage: maxPages, currentPage: currentPage)
                }
            }
            .padding(.bottom,48)
        }
        .background(Color.bg0)
    }
}

#Preview {
    OnboardingView()
}

struct PaywallButton: View {
    
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.white)
                .frame(width: 170, height: 50)
                .background(Color.primaryOrange)
                .cornerRadius(16)
        }
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.fg1.opacity(0.6))
        ) 
    }
}

struct PaywallArgument: View {
    
    let text: String
    let image: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .foregroundStyle(Color.white)
                .imageScale(.large)
            Text(text)
                .foregroundStyle(Color.white)
            Spacer()
        }
    }
}

struct PaywallPagination: View {
    
    let maxPage: Int
    let currentPage: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<maxPage, id: \.self) { page in
                HStack{}
                    .frame(width: 36, height: 3)
                    .background(Color.fg1)
                    .cornerRadius(50)
                    .opacity(currentPage == page ? 1 : 0.2)
            }
        }
    }
}
