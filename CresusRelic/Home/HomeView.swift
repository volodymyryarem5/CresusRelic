//
//  HomeView.swift
//  CresusRelic
//
//  Created by D K on 22.02.2025.
//
//
// Macedonia-Regular
// Macedonia3DFilled-Regular
// MacedoniaOld-Regular
// Cinzel-Regular


import SwiftUI



struct HomeView: View {
    
    @State private var path = NavigationPath()
    @StateObject private var managment = Managment()
    @StateObject private var musicPlayer = AudioPlayer.shared
    
    @State private var isShown = false
    
    init() {
        AudioPlayer.shared.playAudio()
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                FirstBackgroundView()
                
                VStack {
                    //MARK: - TOP
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
                        }
                        .frame(width: 60, height: 60)
                        
                        Text("\(managment.energy)")
                            .foregroundStyle(.semiBrown)
                            .font(.custom("Macedonia-Regular", size: 40))
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                        
                        
                        Spacer()
                        
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
                    }
                    .padding(.horizontal)
                    
                    
                    //MARK: - LOGO
                    Spacer()
                    ZStack {
                        Image("lavr")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .shadow(radius: 10)
                        
                        VStack {
                            Text("Cresus")
                                .multilineTextAlignment(.center)
                                .font(.custom("Macedonia3DFilled-Regular", size: 90))
                                .foregroundStyle(LinearGradient(colors: [.semiYellow, .semiBrown], startPoint: .top, endPoint: .bottom))
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                            Text("Relic")
                                .multilineTextAlignment(.center)
                                .font(.custom("Macedonia3DFilled-Regular", size: 90))
                                .foregroundStyle(LinearGradient(colors: [.semiYellow, .semiBrown], startPoint: .top, endPoint: .bottom))
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                        }
                        .shadow(radius: 10)
                        .shadow(radius: 4)
                        
                    }
                    Spacer()
                    
                    //MARK: - BUTTONS
                    NavigationLink(value: "Era") {
                        ZStack {
                            Image("buttonBG1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width - 50, height: 120)
                            
                            Text("START JOURNEY")
                                .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                .font(.custom("Macedonia-Regular", size: 44))
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                                .shadow(color: .white, radius: 1)
                                .padding(.top, 5)
                        }
                        
                    }
                    
                    HStack {
                        NavigationLink(value: "Art") {
                            VStack {
                                ZStack {
                                    Image("buttonBG2")
                                        .resizable()
                                        .frame(width: 90, height: 90)
                                    
                                    Image("fifthGame")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Text("Artifact \nCollection")
                                    .foregroundStyle(.white)
                                    .font(.custom("Macedonia-Regular", size: 24))
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(value: "Settings") {
                            VStack {
                                ZStack {
                                    Image("buttonBG2")
                                        .resizable()
                                        .frame(width: 90, height: 90)
                                    
                                    Image("settingsIcon")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Text("Settings \n")
                                    .foregroundStyle(.white)
                                    .font(.custom("Macedonia-Regular", size: 24))
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(value: "Shop") {
                            VStack {
                                ZStack {
                                    Image("buttonBG2")
                                        .resizable()
                                        .frame(width: 90, height: 90)
                                    
                                    Image("shopIcon")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                Text("Shop \n")
                                    .foregroundStyle(.white)
                                    .font(.custom("Macedonia-Regular", size: 24))
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            //MARK: - NAVIGATION
            .navigationDestination(for: String.self) { value in
                switch value {
                case "Era": EraSelectionView(path: $path)
                        .navigationBarBackButtonHidden()
                        .onAppear {
                            AudioSoundPlayer.shared.playSound()
                        }
                case "Art":
                    ArtCollectionView(path: $path, managment: managment)
                        .onAppear {
                            AudioSoundPlayer.shared.playSound()
                        }
                        .navigationBarBackButtonHidden()
                case "Settings":
                    SettingsView(path: $path)
                        .onAppear {
                            AudioSoundPlayer.shared.playSound()
                        }
                        .navigationBarBackButtonHidden()
                case "Shop":
                    ShopView(path: $path, managment: managment)
                        .onAppear {
                            AudioSoundPlayer.shared.playSound()
                        }
                        .navigationBarBackButtonHidden()
                case "Levels":
                    LevelsView(path: $path, managment: managment)
                        .navigationBarBackButtonHidden()
                default: EraSelectionView(path: $path)
                        .navigationBarBackButtonHidden()
                }
            }
            .onAppear {
                if !UserDefaults.standard.bool(forKey: "init") {
                    UserDefaults.standard.setValue(true, forKey: "init")
                    UserDefaults.standard.setValue(100, forKey: "coins")
                    UserDefaults.standard.setValue(5, forKey: "energy")
                    UserDefaults.standard.set(true, forKey: "musicPermission")
                    UserDefaults.standard.set(true, forKey: "soundPermission")
                    

                }
                managment.getCoins()
                managment.getKeys()
                managment.getEnergy()
            }
        }
        .sheet(isPresented: $isShown) {
            EnergyView()
        }
    }
    
}

#Preview {
    HomeView()
}
