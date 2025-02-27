//
//  HistoryView.swift
//  CresusRelic
//
//  Created by D K on 27.02.2025.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    
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
                            
                            Text("History")
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
                    .ignoresSafeArea()
                
                ScrollView {
                    HStack {
                        Spacer()
                        
                        NavigationLink(value: "Lydia") {
                            Image("firstEra")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                                .overlay {
                                    Text("Lydia")
                                        .foregroundStyle(.white)
                                        .font(.custom("Cinzel-Regular", size: 32))
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                }
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("thirdEra")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                                .overlay {
                                    Text("GREECE")
                                        .foregroundStyle(.white)
                                        .font(.custom("Cinzel-Regular", size: 32))
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                }
                        }
                        .opacity(0.7)
                        .disabled(true)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("fourthEra")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                                .overlay {
                                    Text("ROME")
                                        .foregroundStyle(.white)
                                        .font(.custom("Cinzel-Regular", size: 32))
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                }
                        }
                        .opacity(0.7)
                        .disabled(true)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("secondEra")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                                .overlay {
                                    Text("EGYPT")
                                        .foregroundStyle(.white)
                                        .font(.custom("Cinzel-Regular", size: 32))
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                }
                        }
                        .opacity(0.7)
                        .disabled(true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image("fifthEra")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(12)
                                .overlay {
                                    Text("MESOPOTAMIA")
                                        .foregroundStyle(.white)
                                        .font(.custom("Cinzel-Regular", size: 20))
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                        .shadow(radius: 1)
                                }
                        }
                        .opacity(0.7)
                        .disabled(true)
                        .padding(.leading, 25)
                        .padding(.top)
                        
                        Spacer()
                        
                       
                        
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    HistoryView(path: .constant(NavigationPath()))
}
