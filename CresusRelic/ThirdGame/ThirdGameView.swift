//
//  ThirdGameView.swift
//  CresusRelic
//
//  Created by D K on 24.02.2025.
//

import SwiftUI

struct ThirdGameView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var managment: Managment
    
    var mazes: [String] = ["mazeA", "mazeD", "mazeE", "mazeF"]
    @State private var selectedMaze = "mazeA"
    @State private var isWinAlertShown = false
    @State private var isLooseAlertShown = false
    
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
                            
                            Text("Golden Maze")
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
                Spacer()
                Text("Which entrance leads to gold?")
                    .foregroundStyle(.white)
                    .font(.custom("Cinzel-Regular", size: 18))
                    .multilineTextAlignment(.center)
                    .padding(.top, -10)
                Spacer()
                Image(selectedMaze)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size().width - 40, height: 340)
                  //  .cornerRadius(6)
                Spacer()
                HStack {
                    Button {
                        checkAnswer(char: "A")
                    } label: {
                        Image("buttonBG2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay {
                                Text("A")
                                    .foregroundStyle(.brown)
                                    .font(.custom("MacedoniaOld-Regular", size: 48))
                            }
                    }
                    
                    Button {
                        checkAnswer(char: "B")
                    } label: {
                        Image("buttonBG2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay {
                                Text("B")
                                    .foregroundStyle(.brown)
                                    .font(.custom("MacedoniaOld-Regular", size: 48))
                            }
                    }
                    
                    Button {
                        checkAnswer(char: "C")
                    } label: {
                        Image("buttonBG2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay {
                                Text("C")
                                    .foregroundStyle(.brown)
                                    .font(.custom("MacedoniaOld-Regular", size: 48))
                            }
                    }
                }
                
                HStack {
                    Button {
                        checkAnswer(char: "D")
                    } label: {
                        Image("buttonBG2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay {
                                Text("D")
                                    .foregroundStyle(.brown)
                                    .font(.custom("MacedoniaOld-Regular", size: 48))
                            }
                    }
                    
                    Button {
                        checkAnswer(char: "E")
                    } label: {
                        Image("buttonBG2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay {
                                Text("E")
                                    .foregroundStyle(.brown)
                                    .font(.custom("MacedoniaOld-Regular", size: 48))
                            }
                    }
                    
                    Button {
                        checkAnswer(char: "F")
                    } label: {
                        Image("buttonBG2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .overlay {
                                Text("F")
                                    .foregroundStyle(.brown)
                                    .font(.custom("MacedoniaOld-Regular", size: 48))
                            }
                    }
                }
                
                Spacer()
                
                
            }
        }
        .onAppear {
            selectedMaze = mazes.randomElement() ?? "mazeA"
        }
        .overlay {
            if isWinAlertShown || isLooseAlertShown {
                ZStack {
                    Rectangle()
                        .background(.thinMaterial.opacity(0.97))
                        .ignoresSafeArea()
                    
                    if isLooseAlertShown {
                        VStack {
                            
                            Text("You answered incorrectly.")
                                .foregroundStyle(.white)
                                .font(.custom("MacedoniaOld-Regular", size: 48))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                                .shadow(radius: 5)
                            
                            Image("energyIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 210)
                                .padding(.vertical, 30)
                                .colorMultiply(isLooseAlertShown ? .gray : .white)
                            
                            Button {
                                dismiss()
                            } label: {
                                ZStack {
                                    Image("buttonBG1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: size().width - 50, height: 120)
                                    
                                    
                                    
                                    Text("Exit")
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
                    
                    if isWinAlertShown {
                        VStack {
                            
                            Text("Your answer is correct!")
                                .foregroundStyle(.white)
                                .font(.custom("MacedoniaOld-Regular", size: 48))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                                .shadow(radius: 5)
                            
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
                                if !UserDefaults.standard.bool(forKey: "thirdGame") {
                                    var levelsCompleted = UserDefaults.standard.integer(forKey: "levelsCompleted")
                                    levelsCompleted += 1
                                    UserDefaults.standard.setValue(levelsCompleted, forKey: "levelsCompleted")
                                    UserDefaults.standard.setValue(true, forKey: "thirdGame")
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
                }
            }
        }
    }
    
    func checkAnswer(char: Character) {
        withAnimation {
            if selectedMaze.last == char {
                isWinAlertShown.toggle()
            } else {
                isLooseAlertShown.toggle()
            }
        }
    }
}

#Preview {
    ThirdGameView(managment: Managment())
}
