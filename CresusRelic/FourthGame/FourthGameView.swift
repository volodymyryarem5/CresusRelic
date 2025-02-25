//
//  FourthGameView.swift
//  CresusRelic
//
//  Created by D K on 24.02.2025.
//

import SwiftUI

struct FourthGameView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var managment: Managment
    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0
    @State private var thirdNumber: Int = 0
    @State private var fourthNumber: Int = 0
    @State private var isLooseAlertShown = false

    @State private var isShown = true
    
    
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
                            
                            Text("Chest code")
                                .font(.custom("MacedoniaOld-Regular", size: 42))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            Button {
                                isShown.toggle()
                            } label: {
                                Image(systemName: "doc.plaintext")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24, weight: .bold))
                            }
                            .frame(width: 10)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, size().height > 667 ? 40: 0)

                    }
                    .ignoresSafeArea()
                
                Image("lockChest")
                    .resizable()
                    .scaledToFill()
                    .frame(width: size().width, height: 320)
                    .clipped()
                    .cornerRadius(12)
                    .overlay {
                        HStack(spacing: 30) {
                            Text("\(firstNumber)")
                                .foregroundStyle(.white)
                                .frame(width: 20)
                                .font(.custom("Cinzel-Regular", size: 32))
                            
                            Text("\(secondNumber)")
                                .font(.custom("Cinzel-Regular", size: 32))                                .foregroundStyle(.white)
                                .frame(width: 20)
                            
                            Text("\(thirdNumber)")
                                .font(.custom("Cinzel-Regular", size: 32))                                .foregroundStyle(.white)
                                .frame(width: 20)
                            
                            Text("\(fourthNumber)")
                                .font(.custom("Cinzel-Regular", size: 32))                                .foregroundStyle(.white)
                                .frame(width: 20)
                        }
                        .padding(.top, 53)
                    }
                
                HStack {
                    NumberPicker(selectedNumber: $firstNumber)

                    NumberPicker(selectedNumber: $secondNumber)

                    NumberPicker(selectedNumber: $thirdNumber)

                    NumberPicker(selectedNumber: $fourthNumber)
                    
                }
                .padding(.top)
                
                Button {
                    if managment.energy > 0 {
                        withAnimation {
                            isLooseAlertShown.toggle()
                        }
                    } else {
                        
                    }
                   
                } label: {
                    ZStack {
                        Image("buttonBG1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 50, height: 120)
                        
                        Text(managment.energy > 0 ? "OPEN CHEST" : "LOW ENERGY \(managment.energy)")
                            .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                            .font(.custom("Macedonia-Regular", size: 44))
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .shadow(color: .white, radius: 1)
                            .padding(.top, 5)
                    }
                    
                }
                .opacity(managment.energy > 0 ? 1 : 0.5)
                .disabled(!(managment.energy > 0))
                
                Spacer()
                
            }
        }
        .overlay {
            if isLooseAlertShown {
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
                                withAnimation {
                                    isLooseAlertShown.toggle()
                                }
                                managment.decreaseEnergy()
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
                }
            }
        }
        .sheet(isPresented: $isShown) {
            if #available(iOS 16.4, *) {
                Image("back2")
                    .resizable()
                    .frame(width: size().width - 20, height: 500)
                    .overlay {
                        VStack {
                            Text("""
    How many sides has a Lycian coin so fine?
    
    How many sons bore the king of gold divine?
    
    How many letters name the capital’s line?
    
    How many foes did Cresus fell in one design?
    """)
                            .padding(.horizontal, 30)
                            .font(.custom("Cinzel-Regular", size: 22))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            
                            Button {
                                isShown.toggle()
                            } label: {
                                ZStack {
                                    Image("buttonBG3")
                                        .resizable()
                                        .frame(width: size().width - 90, height: 80)
                                    
                                    Text("Close")
                                        .font(.custom("Cinzel-Regular", size: 22))
                                        .foregroundStyle(.black)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                    .presentationBackground(.thinMaterial)
            } else {
                Image("back2")
                    .resizable()
                    .frame(width: size().width - 20, height: 500)
                    .overlay {
                        VStack {
                            Text("""
    How many sides has a Lycian coin so fine?
    
    How many sons bore the king of gold divine?
    
    How many letters name the capital’s line?
    
    How many foes did Cresus fell in one design?
    """)
                            .padding(.horizontal, 30)
                            .font(.custom("Cinzel-Regular", size: 22))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            
                            Button {
                                isShown.toggle()
                            } label: {
                                ZStack {
                                    Image("buttonBG3")
                                        .resizable()
                                        .frame(width: size().width - 90, height: 80)
                                    
                                    Text("Close")
                                        .font(.custom("Cinzel-Regular", size: 22))
                                        .foregroundStyle(.black)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    FourthGameView(managment: Managment())
}


struct NumberPicker: View {
    @Binding  var selectedNumber: Int
    let numbers = Array(0...9)
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedNumber) {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                        .font(.largeTitle)
                        .tag(number)
                        .foregroundColor(.brown)
                        .font(.custom("Cinzel-Regular", size: 32))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 70, height: 90)
            .clipped()
        }
        .background {
            Image("back1")
                .resizable()
        }
    }
}
