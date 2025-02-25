//
//  SecondGameView.swift
//  CresusRelic
//
//  Created by D K on 24.02.2025.
//

import SwiftUI

struct SecondGameView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isShown = false
    @ObservedObject var managment: Managment
    
    
    var body: some View {
        ZStack {
            FirstBackgroundView()
            
            VStack {
                Rectangle()
                    .frame(width: size().width, height: size().height / 9)
                    .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 34, bottomTrailingRadius: 34, topTrailingRadius: 0))
                    .shadow(radius: 10, y: 10)
                    .shadow(radius: 10, y: 10)
                    .overlay {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .bold))
                            }
                            .frame(width: 10)
                            
                            Spacer()
                            
                            Text("Map of Lydia")
                                .font(.custom("MacedoniaOld-Regular", size: 42))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            HStack {
                                
                            }
                            .frame(width: 10)
                        }
                        .padding(.top, size().height > 667 ? 40: 0)
                        .padding(.horizontal, 25)
                    }
                    .ignoresSafeArea()
                
                PuzzleGameView() {
                    withAnimation {
                        isShown.toggle()
                    }
                }
                
                if isShown {
                    VStack {
                        HStack {
                            
                            Image("coinIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 90)
                            
                            Text("100")
                                .foregroundStyle(.semiBrown)
                                .font(.custom("Macedonia-Regular", size: 55))
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                        }
                        
                        Button {
                            if !UserDefaults.standard.bool(forKey: "secondGame") {
                                var levelsCompleted = UserDefaults.standard.integer(forKey: "levelsCompleted")
                                levelsCompleted += 1
                                UserDefaults.standard.setValue(levelsCompleted, forKey: "levelsCompleted")
                                UserDefaults.standard.setValue(true, forKey: "secondGame")
                            }
                            managment.coins += 100
                            managment.updateCoins()
                            managment.decreaseEnergy()
                            dismiss()
                        } label: {
                            ZStack {
                                Image("buttonBG1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: size().width - 50, height: 120)
                                
                                Text("Claim Reward")
                                    .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                    .font(.custom("Macedonia-Regular", size: 44))
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .padding(.top, 5)
                            }
                            
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SecondGameView(managment: Managment())
}
