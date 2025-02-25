//
//  ShopView.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI

struct ShopView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    @ObservedObject var managment: Managment
    
    var body: some View {
        ZStack {
            FirstBackgroundView()
            
            VStack {
                Rectangle()
                    .frame(width: size().width, height: size().height / 6)
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
                            
                            Text("Shop")
                                .font(.custom("MacedoniaOld-Regular", size: 42))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            HStack {
                                
                            }
                            .frame(width: 10)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, size().height > 667 ? 30: 0)

                    }
                
                Image("buttonBG4")
                    .resizable()
                    .frame(width: 130, height: 60)
                    .overlay {
                        HStack {
                            Image("coinIcon")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("\(managment.coins)")
                                .foregroundStyle(.semiBrown)
                                .font(.custom("Macedonia-Regular", size: 34))
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                        }
                        .padding(.trailing, 10)
                    }
                    .padding(.top, 20)
                
                HStack {
                    ShopButton(image: "energyIcon", price: "100") {
                        managment.coins -= 100
                        managment.energy += 5
                        managment.updateEnergy()
                        managment.updateCoins()
                    }
                    .opacity(managment.coins >= 100 ? 1 : 0.5)
                    .disabled(!(managment.coins >= 100))
                    
                    Spacer()
                    
                    ShopButton(image: "key", price: "1000") {
                        managment.coins -= 1000
                        managment.keys += 1
                        UserDefaults.standard.setValue(managment.keys, forKey: "keys")
                        managment.updateCoins()
                    }
                    .opacity(managment.coins >= 1000 ? 1 : 0.5)
                    .disabled(!(managment.coins >= 1000))
                }
                .padding(.horizontal, 35)
                .padding(.top, 20)
                
               
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    ShopView(path: .constant(NavigationPath()), managment: Managment())
}
