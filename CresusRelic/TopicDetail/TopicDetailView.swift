//
//  TopicDetailView.swift
//  CresusRelic
//
//  Created by D K on 27.02.2025.
//

import SwiftUI

struct TopicDetailView: View {
    
    
    var image: String
    var text: String
    
    @Environment(\.dismiss) var dismiss

    
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
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size().width - 60)
                        .cornerRadius(12)
                    
                    Text(text)
                        .padding()
                        .foregroundColor(.white)
                        .font(.custom("Cinzel-Regular", size: 26))
                        .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
                .padding(.top, -20)
            }
        }
    }
}

#Preview {
    TopicDetailView(image: "1", text: "The Lydian Kingdom emerged in western Anatolia around the 7th century BCE, flourishing under the rule of the Mermnad dynasty. It was a land of rich resources, especially gold, which allowed its rulers to amass wealth and power. The Lydians were known for their military strength and their conflicts with neighboring Greek city-states.")
}
