//
//  EnergyView.swift
//  CresusRelic
//
//  Created by D K on 24.02.2025.
//

import SwiftUI

struct EnergyView: View {
    var body: some View {
        ZStack {
            FirstBackgroundView()
            Rectangle()
                .foregroundColor(.black.opacity(0.6))
                .ignoresSafeArea()
            
            ScrollView {
                
                Text("Energy Mechanic Description")
                    .foregroundStyle(.white)
                    .font(.custom("Cinzel-Regular", size: 22))
                    .padding(.horizontal)
                    .padding(.top, 30)
                    .multilineTextAlignment(.center)
                
                Text("""
In the game, energy is a crucial resource that depletes each time you complete or fail a level. To restore energy, you have two options: wait for a certain period or purchase it using in-game coins from the shop.

Energy automatically replenishes every 2 hours. When this happens, you will receive a push notification informing you that your energy has been restored.
""")
                .foregroundStyle(.white)
                .font(.custom("Cinzel-Regular", size: 22))
                .padding(.horizontal)
                .padding(.top)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    EnergyView()
}
