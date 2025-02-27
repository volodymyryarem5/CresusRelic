//
//  LydiaTopicsView.swift
//  CresusRelic
//
//  Created by D K on 27.02.2025.
//

import SwiftUI

extension Int: Identifiable {
    public var id: Int { self }
}

struct LydiaTopicsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    
    @State private var textIndexToShow: Int = 0
    @State private var imageIndexToShow: Int?
    
    var images: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var text: [String] = [
"""
The Lydian Kingdom emerged in western Anatolia around the 7th century BCE, flourishing under the rule of the Mermnad dynasty. It was a land of rich resources, especially gold, which allowed its rulers to amass wealth and power. The Lydians were known for their military strength and their conflicts with neighboring Greek city-states.
""",
"""
King Croesus, the last ruler of Lydia, was famed for his immense wealth and is credited with issuing the first standardized gold and silver coins. His kingdom prospered, but he famously misinterpreted the Oracle of Delphi’s prophecy and went to war with Persia, leading to Lydia’s downfall.
""",
"""
The Lydians revolutionized trade by inventing the first true coins, made of electrum, a natural alloy of gold and silver. This innovation changed commerce forever, leading to the standardized monetary systems we use today.
""",
"""
The Lydians were fierce warriors who fought against the Greeks and Persians. Their cavalry was renowned for its speed, and their soldiers used advanced weapons and armor for the time. However, despite their might, they fell to the Persian Empire in 546 BCE.
""",
"""
King Croesus famously consulted the Oracle of Delphi before waging war against Persia. The ambiguous prophecy—“If you cross the river Halys, you will destroy a great empire”—led to his downfall when he realized too late that the empire destroyed was his own.
""",
"""
Sardis was the grand capital of Lydia, known for its wealth, strategic location, and impressive architecture. It housed the famous Pactolus River, said to be rich in gold, and a great temple dedicated to the goddess Cybele.
""",
"""
The Lydians were not only warriors but also cultural pioneers, influencing Greek music, fashion, and even religious practices. Their luxurious lifestyle was admired and adopted by neighboring civilizations.
""",
"""
In 546 BCE, the Persian King Cyrus the Great defeated Croesus, bringing Lydia under Persian rule. This marked a turning point in the region’s history, as Lydian culture blended with Persian administration.
""",
"""
According to legend, King Midas, cursed with the golden touch, washed his hands in the Pactolus River, transferring his golden power to its waters. This is said to explain why Lydia was so rich in gold.
"""
    ]
    
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
                            
                            Text("LYDIA History")
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
                    
                    Button {
                        textIndexToShow = 0
                        imageIndexToShow = 0
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("The Rise of the Lydian Kingdom")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    
                    Button {
                        textIndexToShow = 1
                        imageIndexToShow = 1
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("Cresus: The Wealthiest King of Lydia")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    
                    Button {
                        textIndexToShow = 2
                        imageIndexToShow = 2
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("Lydia and the First Coinage")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    
                    Button {
                        textIndexToShow = 3
                        imageIndexToShow = 3
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("Lydian Warfare and Military Tactics")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                                    
                    
                    Button {
                        textIndexToShow = 4
                        imageIndexToShow = 4
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("The Oracle of Delphi and Lydia’s Fate")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    
                    Button {
                        textIndexToShow = 5
                        imageIndexToShow = 5
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("Sardis: The Heart of Lydia")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    
                    Button {
                        textIndexToShow = 6
                        imageIndexToShow = 6
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("Lydian Culture and Influence on the Ancient World")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    
                    Button {
                        textIndexToShow = 7
                        imageIndexToShow = 7
                    } label: {
                        Image("buttonBG5")
                            .resizable()
                            .frame(width: size().width - 40, height: 80)
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Text("Lydia and the Persian Conquest")
                                        .foregroundStyle(LinearGradient(colors: [.lightGreen, .semiGreen, .darkGreen], startPoint: .top, endPoint: .bottom))
                                        .font(.custom("Macedonia-Regular", size: 34))
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .shadow(color: .white, radius: 1)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                            }
                    }
                    .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
            }
        }
        .fullScreenCover(item: $imageIndexToShow) { new in
            TopicDetailView(image: images[new], text: text[textIndexToShow])
        }
    }
}

#Preview {
    LydiaTopicsView(path: .constant(NavigationPath()))
}
