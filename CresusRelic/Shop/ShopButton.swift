//
//  ShopButton.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI

struct ShopButton: View {
    
    var image: String
    var price: String
    
    var completion: () -> ()
    
    var body: some View {
        Image("back2")
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 140)
            .overlay {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: image == "key" ? 80 : 50, height: 50)
            }
            .overlay {
                VStack {
                    Spacer()
                    
                    Button {
                        completion()
                    } label: {
                        ZStack {
                            
                            
                            Image("buttonBG1")
                                .resizable()
                                .frame(width: 190, height: 80)
                               
                            HStack {
                                Text("BUY")
                                    .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                    .font(.custom("Macedonia-Regular", size: 24))
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .padding(.top, 2)
                                
                                Spacer()
                                
                                Text(price)
                                    .foregroundStyle(.semiBrown)
                                    .font(.custom("Macedonia-Regular", size: 34))
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                
                                Spacer()
                                
                                Image("coinIcon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 50)
                            }
                            .frame(width: 140)
                        }
                    }
                    .padding(.top, 140)
                }
            }
    }
}

#Preview {
    ShopButton(image: "key", price: "100"){}
}
