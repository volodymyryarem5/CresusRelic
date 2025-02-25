//
//  LevelsView.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI

struct LevelsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    @ObservedObject var managment: Managment
    
    @State private var is1GameShown = false
    @State private var is2GameShown = false
    @State private var is3GameShown = false
    @State private var is4GameShown = false
    
    @State private var isAlertShown = false
    @State private var levelsCompleted = 0
    
    @State private var isShown = false
    
    var body: some View {
        ZStack {
            SecondBackgroundView()
                .blur(radius: 3)
                .overlay {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.5))
                        .ignoresSafeArea()
                }
            
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
                                path.removeLast(path.count)
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .bold))
                            }
                            .frame(width: 60)
                            
                            Spacer()
                            
                            Text("LYDIA \nLEVELS")
                                .font(.custom("MacedoniaOld-Regular", size: 42))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            
                            HStack {
                                Button {
                                    isShown.toggle()
                                } label: {
                                    ZStack {
                                        Image("buttonBG2")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                        
                                        Image("energyIcon")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 13, height: 13)
                                    }
                                    .frame(width: 60, height: 60)
                                }
                              
                                
                                Text("\(managment.energy)")
                                    .foregroundStyle(.semiBrown)
                                    .font(.custom("Macedonia-Regular", size: 40))
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                            }
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, size().height > 667 ? 30: 0)

                    }
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        Image("progress")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 20, height: 80)
                            .overlay {
                                Text("Fully Completed \(levelsCompleted) / 4")
                                    .foregroundStyle(.white)
                                    .font(.custom("Cinzel-Regular", size: 18))
                            }
                        
                        Button {
                            if managment.energy <= 0 {
                                withAnimation {
                                    isAlertShown.toggle()
                                }
                            } else {
                                is1GameShown.toggle()
                            }
                        } label: {
                            Image("buttonBG5")
                                .resizable()
                                .frame(width: size().width - 40, height: 80)
                                .overlay {
                                    HStack {
                                        Image("firstGame")
                                            .resizable()
                                            .frame(width: 65, height: 65)
                                        
                                        
                                        
                                        Text("Secrets of Lydia")
                                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                            .font(.custom("Macedonia-Regular", size: 34))
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                        }
                        
                        Button {
                            if managment.energy <= 0 {
                                withAnimation {
                                    isAlertShown.toggle()
                                }
                            } else {
                                is2GameShown.toggle()
                            }
                        } label: {
                            Image("buttonBG5")
                                .resizable()
                                .frame(width: size().width - 40, height: 80)
                                .overlay {
                                    HStack {
                                        Image("thirdGame")
                                            .resizable()
                                            .frame(width: 65, height: 65)
                                        
                                        
                                        
                                        Text("Puzzle Lydia's Map")
                                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                            .font(.custom("Macedonia-Regular", size: 34))
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                        }
                        
                        Button {
                            if managment.energy <= 0 {
                                withAnimation {
                                    isAlertShown.toggle()
                                }
                            } else {
                                is3GameShown.toggle()
                            }
                        } label: {
                            Image("buttonBG5")
                                .resizable()
                                .frame(width: size().width - 40, height: 80)
                                .overlay {
                                    HStack {
                                        Image("fourthGame")
                                            .resizable()
                                            .frame(width: 65, height: 65)
                                        
                                        
                                        
                                        Text("Golden Maze")
                                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                            .font(.custom("Macedonia-Regular", size: 34))
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                        }
                        
                        Button {
                            if managment.energy <= 0 {
                                withAnimation {
                                    isAlertShown.toggle()
                                }
                            } else {
                                is4GameShown.toggle()
                            }
                        } label: {
                            Image("buttonBG5")
                                .resizable()
                                .frame(width: size().width - 40, height: 80)
                                .overlay {
                                    HStack {
                                        Image("fifthGame")
                                            .resizable()
                                            .frame(width: 65, height: 65)
                                        
                                        
                                        
                                        Text("Chest code")
                                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                            .font(.custom("Macedonia-Regular", size: 34))
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading)
                                }
                        }
                    }
                }
                .padding(.top)
                .scrollIndicators(.hidden)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            levelsCompleted = UserDefaults.standard.integer(forKey: "levelsCompleted")
        }
        .overlay {
            if isAlertShown {
                Image("back2")
                    .resizable()
                    .frame(width: size().width - 40, height: 400)
                    .overlay {
                        VStack {
                            Text("Oops, looks like you're out of energy. \nYou can wait a while to accumulate it, or get it from the store.")
                                .foregroundStyle(.white)
                                .font(.custom("Cinzel-Regular", size: 24))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                            
                            Button {
                                path.append("Shop")
                            } label: {
                                ZStack {
                                    Image("buttonBG1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: size().width - 150, height: 70)
                                    
                                    Text("Shop")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 44))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .padding(.top, 5)
                                }
                            }
                            
                            Button {
                                withAnimation {
                                    isAlertShown.toggle()
                                }
                            } label: {
                                ZStack {
                                    Image("buttonBG1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: size().width - 150, height: 70)
                                    
                                    Text("Close")
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
            }
        }
        .fullScreenCover(isPresented: $is1GameShown) {
            FirstGameView(questions: DataManager.shared.quizQuestions, managment: managment)
                .onAppear {
                    AudioSoundPlayer.shared.playSound()
                }
        }
        .fullScreenCover(isPresented: $is2GameShown) {
            SecondGameView(managment: managment)
                .onAppear {
                    AudioSoundPlayer.shared.playSound()
                }
        }
        .fullScreenCover(isPresented: $is3GameShown) {
            ThirdGameView(managment: managment)
                .onAppear {
                    AudioSoundPlayer.shared.playSound()
                }
        }
        .fullScreenCover(isPresented: $is4GameShown) {
            FourthGameView(managment: managment)
                .onAppear {
                    AudioSoundPlayer.shared.playSound()
                }
        }
        .sheet(isPresented: $isShown) {
            EnergyView()
        }
    }
}

#Preview {
    LevelsView(path: .constant(NavigationPath()), managment: Managment())
}
