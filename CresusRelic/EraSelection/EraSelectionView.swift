//
//  EraSelectionView.swift
//  CresusRelic
//
//  Created by D K on 22.02.2025.
//

import SwiftUI

struct EraSelectionView: View {
    
    @State private var isZoomed = false
    @Namespace private var animation
    @Namespace private var animation2
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            SecondBackgroundView()
                .blur(radius: 3)
                .overlay {
                    Rectangle()
                        .foregroundStyle(.black.opacity(0.5))
                        .ignoresSafeArea()
                }
            
            ScrollView {
                Image("map")
                    .resizable()
                    .frame(width: size().width)
                    .blur(radius: 2)
                    .cornerRadius(24)
                    .overlay {
                        VStack {
                            Button {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    isZoomed.toggle()
                                }
                            } label: {
                                VStack {
                                    Image("firstEra")
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 100, height: 100)
                                         .cornerRadius(12)
                                         .padding(.top, 170)
                                         .padding(.trailing, 150)
                                         .shadow(color: .black, radius: 5)
                                         .shadow(color: .semiYellow, radius: 10)
                                         .matchedGeometryEffect(id: "1", in: animation)
                                         .matchedGeometryEffect(id: "2", in: animation2)

                                    Text("Lydia")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 44))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .padding(.top, 5)
                                        .padding(.trailing, 150)
                                }
                            }
                            .overlay {
                                Image("traces")
                                     .resizable()
                                     .frame(width: 110, height: 120)
                                     .scaleEffect(x: 1, y: -1)
                                     .padding(.top, 190)
                                     .padding(.leading, 90)
                                     .colorInvert()
                            }
                            
                         
                            
                            Button {
                                
                            } label: {
                                VStack {
                                    Image("thirdEra")
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 100, height: 100)
                                         .overlay {
                                             ZStack {
                                                 Rectangle()
                                                     .foregroundStyle(.black.opacity(0.7))
                                                     .frame(width: 100, height: 100)
                                                 Image("lockIcon")
                                                     .resizable()
                                                     .scaledToFill()
                                                     .frame(width: 35, height: 35)
                                             }
                                         }
                                         .cornerRadius(12)
                                         .padding(.top, 10)
                                         .padding(.leading, 150)
                                         .shadow(color: .black, radius: 5)
                                         .shadow(color: .semiYellow, radius: 10)
                                        
                                    
                                    Text("Greece")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 44))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .padding(.top, 5)
                                        .padding(.leading, 150)
                                }
                               
                            }
                            .disabled(true)
                            .overlay {
                                Image("traces")
                                     .resizable()
                                     .frame(width: 110, height: 120)
                                     .scaleEffect(x: 1, y: 1)
                                     .padding(.top, -20)
                                     .padding(.trailing, -90)
                                     .rotationEffect(.degrees(180))
                                     .colorInvert()
                            }
                            
                         
                            
                            Button {
                                
                            } label: {
                                VStack {
                                    Image("fourthEra")
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 100, height: 100)
                                         .overlay {
                                             ZStack {
                                                 Rectangle()
                                                     .foregroundStyle(.black.opacity(0.7))
                                                     .frame(width: 100, height: 100)
                                                 Image("lockIcon")
                                                     .resizable()
                                                     .scaledToFill()
                                                     .frame(width: 35, height: 35)
                                             }
                                         }
                                         .cornerRadius(12)
                                         .padding(.top, 10)
                                         .padding(.trailing, 150)
                                         .shadow(color: .black, radius: 5)
                                         .shadow(color: .semiYellow, radius: 10)
                                    
                                    Text("Rome")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 44))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .padding(.top, 5)
                                        .padding(.trailing, 150)
                                }
                            }
                            .disabled(true)
                            .overlay {
                                Image("traces")
                                     .resizable()
                                     .frame(width: 110, height: 120)
                                     .scaleEffect(x: 1, y: -1)
                                     .padding(.top, 10)
                                     .padding(.leading, 90)
                                     .colorInvert()
                            }
                            
                            Button {
                                
                            } label: {
                                VStack {
                                    Image("secondEra")
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 100, height: 100)
                                         .overlay {
                                             ZStack {
                                                 Rectangle()
                                                     .foregroundStyle(.black.opacity(0.7))
                                                     .frame(width: 100, height: 100)
                                                 Image("lockIcon")
                                                     .resizable()
                                                     .scaledToFill()
                                                     .frame(width: 35, height: 35)
                                             }
                                         }
                                         .cornerRadius(12)
                                         .padding(.top, 10)
                                         .padding(.leading, 150)
                                         .shadow(color: .black, radius: 5)
                                         .shadow(color: .semiYellow, radius: 10)
                                    
                                    Text("Egypt")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 44))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .padding(.top, 5)
                                        .padding(.leading, 150)
                                }
                            }
                            .disabled(true)
                            .overlay {
                                Image("traces")
                                     .resizable()
                                     .frame(width: 110, height: 120)
                                     .scaleEffect(x: 1, y: 1)
                                     .padding(.top, -20)
                                     .padding(.trailing, -90)
                                     .rotationEffect(.degrees(180))
                                     .colorInvert()
                            }
                        
                            
                            Button {
                                
                            } label: {
                                VStack {
                                    Image("fifthEra")
                                         .resizable()
                                         .scaledToFill()
                                         .frame(width: 100, height: 100)
                                         .overlay {
                                             ZStack {
                                                 Rectangle()
                                                     .foregroundStyle(.black.opacity(0.7))
                                                     .frame(width: 100, height: 100)
                                                 Image("lockIcon")
                                                     .resizable()
                                                     .scaledToFill()
                                                     .frame(width: 35, height: 35)
                                             }
                                         }
                                         .cornerRadius(12)
                                         .padding(.top, 10)
                                         .padding(.trailing, 150)
                                         .shadow(color: .black, radius: 5)
                                         .shadow(color: .semiYellow, radius: 10)
                                    
                                    Text("Mesopotamia")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 44))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .padding(.top, 5)
                                        .padding(.trailing, 150)
                                }
                            }
                            .disabled(true)
                            
                            Spacer()
                        }
                    }
            }
            .scrollIndicators(.hidden)
        }
        .overlay {
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
                            
                            Text("ERA SELECTION")
                                .font(.custom("MacedoniaOld-Regular", size: 42))
                                .foregroundStyle(.white)
                                
                            
                            Spacer()
                            
                            HStack {
                                
                            }
                            .frame(width: 10)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, size().height > 667 ? 30: 0)
                    }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        .overlay {
            if isZoomed {
            ZStack {
                Rectangle()
                    .foregroundStyle(.darkGreen.opacity(0.8))
                    .background(.ultraThinMaterial.opacity(0.8))
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                isZoomed.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .font(.system(size: 24, weight: .bold))
                        }
                        .frame(width: 15)
                        
                        Spacer()
                        
                        Text("LYDIA")
                            .font(.custom("MacedoniaOld-Regular", size: 42))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        HStack {
                            
                        }.frame(width: 15)
                    }
                    .padding(.horizontal)
                  
                    
                    Image("firstEra")
                         .resizable()
                         .scaledToFill()
                         .frame(width: 250, height: 250)
                         .cornerRadius(12)
                         .padding(.top)
                         .matchedGeometryEffect(id: "2", in: animation2)
                    
                    ScrollView {
                        Text("""
Lydia was an ancient kingdom in western Anatolia, known for its rich gold deposits and as the birthplace of coinage. Flourishing between the 7th and 6th centuries BCE, it was ruled by the Mermnad dynasty, including the famous King Croesus. Lydia's capital, Sardis, became a major cultural and economic hub. The kingdom was eventually conquered by the Persian Empire in the mid-6th century BCE.
""")
                    }
                    .font(.custom("Cinzel-Regular", size: 24))
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .scrollIndicators(.hidden)
                    
                    Button {
                        path.append("Levels")
                    } label: {
                        ZStack {
                            Image("buttonBG1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width - 50, height: 120)
                            
                            Text("Select")
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
            .matchedGeometryEffect(id: "1", in: animation2)
            }
        
        }
    }
}

#Preview {
    EraSelectionView(path: .constant(NavigationPath()))
}
