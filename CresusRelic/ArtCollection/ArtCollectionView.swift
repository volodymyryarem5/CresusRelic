//
//  ArtCollectionView.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI

struct ArtCollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    @ObservedObject var managment: Managment
    @State private var currentIndex: Double = 0.0
    @State private var selectedArt = "firstArt"
    @State private var lek = 1
    
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
                            .frame(width: 80)
                            
                            Spacer()
                            
                            HStack {
                                Text("ARTIFACT \nCollection")
                                    .font(.custom("MacedoniaOld-Regular", size: 42))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                
                            }
                            Spacer()
                            
                            Image("buttonBG4")
                                .resizable()
                                .frame(width: 80, height: 60)
                                .overlay {
                                    HStack {
                                        Image("key")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                        
                                        Text("\(managment.keys)")
                                            .foregroundStyle(.semiBrown)
                                            .font(.custom("Macedonia-Regular", size: 34))
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                            .shadow(color: .white, radius: 1)
                                    }
                                    .padding(.trailing, 10)
                                }
                            .frame(width: 70)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, size().height > 667 ? 30: 0)

                    }
                    .ignoresSafeArea()
                ZStack {
                    VStack {
                        Image("postament")
                            .resizable()
                            .frame(width: 190, height: 190)
                            .shadow(radius: 4, y: 5)
                            .shadow(radius: 4, y: 5)
                            .shadow(radius: 4, y: 5)
                        
                    }
                    .offset(y: 150)
                    CarouselView(currentIndex: $currentIndex, selectedImage: $selectedArt, keklol: $lek)
                }
                
                Spacer()
                
                if !UserDefaults.standard.bool(forKey: selectedArt)  {
                    Button {
                        if managment.keys > 0 {
                            managment.keys -= 1
                            UserDefaults.standard.setValue(managment.keys, forKey: "keys")
                            
                            withAnimation {
                                UserDefaults.standard.setValue(true, forKey: selectedArt)
                                lek += 1
                            }
                        }
                    } label: {
                        ZStack {
                            Image("buttonBG1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: size().width - 50, height: 120)
                            
                            HStack {
                                Text("OPEN ARTIFACT")
                                    .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                    .font(.custom("Macedonia-Regular", size: 44))
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .padding(.top, 5)
                                
                                Image("key")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                        }
                        .colorMultiply(managment.keys > 0 ? .white : .gray)
                        .opacity(managment.keys > 0 ? 1 : 0.5)
                    }
                    .disabled(!(managment.keys > 0))
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    ArtCollectionView(path: .constant(NavigationPath()), managment: Managment())
}


struct CarouselImage: Identifiable {
    let id: Int
    let imageName: String
}

class CarouselViewModel: ObservableObject {
    @Published var images: [CarouselImage]
    
    private let imageNames = ["firstArt", "secondArt", "thirdArt", "fourthArt", "fifthArt"]
    
    init() {
        images = imageNames.enumerated().map { index, imageName in
            CarouselImage(id: index, imageName: imageName)
        }
    }
}

struct CarouselView: View {
    @StateObject private var viewModel = CarouselViewModel()
    @Binding var currentIndex: Double
    @Binding var selectedImage: String
    @State private var dragOffset: Double = 0.0
    @Binding  var keklol: Int
    
    var body: some View {
        ZStack {
            ZStack {
                ForEach(viewModel.images) { image in
                    Image(image.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .cornerRadius(12)
                        .scaleEffect(1.0 - abs(distanceFromCenter(image.id)) * 0.2)
                        .opacity(1.0 - abs(distanceFromCenter(image.id)) * 0.3)
                        .offset(x: xOffset(for: image.id), y: 0)
                        .zIndex(1.0 - abs(distanceFromCenter(image.id)) * 0.1)
                        .colorMultiply(UserDefaults.standard.bool(forKey: image.imageName) ? .white : .black)
                        .shadow(color: .semiYellow,radius: 10, y: 0)
                        .shadow(color: .semiYellow,radius: 2, y: 0)
                        .onTapGesture {
                            print("\(image.imageName)")
                        }
                        .overlay {
                            Text("\(keklol)")
                                .font(.system(size: 1))
                        }
                    
                }
                
            }
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        dragOffset = currentIndex + gesture.translation.width / 100
                    }
                    .onEnded { gesture in
                        withAnimation {
                            dragOffset = currentIndex + gesture.predictedEndTranslation.width / 100
                            dragOffset = round(dragOffset).remainder(dividingBy: Double(viewModel.images.count))
                            currentIndex = dragOffset
                        }
                        getSelectedArt(currentIndex: Int(currentIndex))
                    }
            )
          
         
        }
    }
    
    private func distanceFromCenter(_ imageId: Int) -> Double {
        return (dragOffset - Double(imageId)).remainder(dividingBy: Double(viewModel.images.count))
    }
    
    private func xOffset(for imageId: Int) -> Double {
        let angle = Double.pi * 2 / Double(viewModel.images.count) * distanceFromCenter(imageId)
        return sin(angle) * 200
    }
    
    private func getSelectedArt(currentIndex: Int) {
        switch currentIndex {
        case 0: selectedImage = "firstArt"
        case 1: selectedImage = "secondArt"
        case 2: selectedImage = "thirdArt"
        case -1: selectedImage = "fifthArt"
        case -2: selectedImage = "fourthArt"
        default: selectedImage = "firstArt"
        }
        print(selectedImage)
    }
}
