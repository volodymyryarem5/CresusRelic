//
//  SettingsView.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI
import StoreKit


struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    @StateObject private var musicPlayer = AudioPlayer.shared
    @StateObject private var sounPlayer = AudioSoundPlayer.shared
    
    @State private var isFirstShown = false
    @State private var isSecondShown = false
    
    
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
                            
                            Text("Settings")
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
                
                HStack {
                    Spacer()
                    Button {
                        sounPlayer.isSoundEnabled.toggle()
                    } label: {
                        ZStack {
                            Image("back1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 140)
                            
                            Image("soundIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 140)
                        }
                    }
                    .opacity(sounPlayer.isSoundEnabled ? 1 : 0.5)
                    
                    Spacer()
                    
                    Button {
                        musicPlayer.isAudioEnabled.toggle()
                    } label: {
                        ZStack {
                            Image("back1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 140)
                            
                            Image("musicIcon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                        }
                    }
                    .opacity(musicPlayer.isAudioEnabled ? 1 : 0.5)
                    
                    Spacer()
                }
                
                Button {
                    isFirstShown.toggle()
                    showContact()
                } label: {
                    ZStack {
                        Image("buttonBG1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 50, height: 120)
                        
                        Text("FEEDBACK")
                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                            .font(.custom("Macedonia-Regular", size: 44))
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .padding(.top, 5)
                    }
                    
                }
                
                Button {
                    isSecondShown.toggle()
                    showPrivacy()
                } label: {
                    ZStack {
                        Image("buttonBG1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 50, height: 120)
                        
                        Text("PRIVACY POLICY")
                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                            .font(.custom("Macedonia-Regular", size: 44))
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .padding(.top, 5)
                    }
                    
                }
                
                Button {
                    rateApp()
                } label: {
                    ZStack {
                        Image("buttonBG1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 50, height: 120)
                        
                        Text("RATE US")
                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                            .font(.custom("Macedonia-Regular", size: 44))
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .padding(.top, 5)
                    }
                    
                }
                
                Spacer()
            }
        }
    }
    
    func rateApp() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    func showPrivacy() {
        if let url = URL(string: "https://sites.google.com/view/cresusrelic/privacy-policy") {
            UIApplication.shared.open(url)
        }
    }
    
    func showContact() {
        if let url = URL(string: "https://sites.google.com/view/cresusrelic/contact-us") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView(path: .constant(NavigationPath()))
}
