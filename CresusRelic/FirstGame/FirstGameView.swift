//
//  FirstGameView.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI

struct FirstGameView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let questions: [QuizQuestion]
    @ObservedObject var managment: Managment
    @State private var currentQuestionIndex: Int = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showFeedback: Bool = false
    @State private var counter = 0
    @State private var coins = 0
    
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
                            
                            Text("Secrets of Lydia")
                                .font(.custom("MacedoniaOld-Regular", size: 42))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            HStack {
                                
                            }
                            .frame(width: 10)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, size().height > 667 ? 40: 0)

                    }
                    .ignoresSafeArea()
                
                //QUIZ
                
                VStack(spacing: 10) {
                    if currentQuestionIndex < questions.count {
                        let currentQuestion = questions[currentQuestionIndex]
                        Text(currentQuestion.question)
                            .font(.custom("Cinzel-Regular", size: 22))
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .frame(width: size().width - 50, height: 190)
                            .background {
                                Image("buttonBG5")
                                    .resizable()
                            }
                        
                        Spacer()
                        
                        // Варианты ответов
                        ForEach(0..<currentQuestion.answers.count, id: \.self) { index in
                            Button(action: {
                                if !showFeedback {
                                    selectedAnswer = index
                                    showFeedback = true
                                    
                                    // Проверяем, был ли ответ правильным
                                    if let selectedAnswer = selectedAnswer {
                                        let currentQuestion = questions[currentQuestionIndex]
                                        if selectedAnswer == currentQuestion.rightAnswer {
                                            counter += 1
                                            coins += 10
                                        } else {
                                            
                                        }
                                    }
                                }
                            }) {
                                Text(currentQuestion.answers[index])
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        showFeedback ?
                                        (index == currentQuestion.rightAnswer ? Image("buttonBG3") :
                                            (index == selectedAnswer ? Image("buttonBG4") : Image("buttonBG4"))) :
                                            (index == selectedAnswer ? Image("buttonBG4") : Image("buttonBG4"))
                                    )
                                    .font(.custom("Cinzel-Regular", size: 18))
                                    .minimumScaleFactor(0.8)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                            .disabled(showFeedback)
                        }
                        
                        // Кнопка "Продолжить"
                        Spacer()
                        
                        Button(action: {
                            goToNextQuestion()
                        }) {
                            Text("Next")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background {
                                    Image("buttonBG5")
                                }
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.custom("Cinzel-Regular", size: 18))
                        }
                        .disabled(!showFeedback)
                        .padding(.bottom)
                    } else {
                        VStack {
                            Text("You answered \(counter) questions correctly.")
                                .font(.custom("Cinzel-Regular", size: 24))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                            
                            if counter == questions.count {
                                Text("You have passed this level!")
                                    .font(.custom("Cinzel-Regular", size: 24))
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .padding()
                            }
                            
                            HStack {
                                
                                Image("coinIcon")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 90)
                                
                                Text("\(coins)")
                                    .foregroundStyle(.semiBrown)
                                    .font(.custom("Macedonia-Regular", size: 55))
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                                    .shadow(color: .white, radius: 1)
                            }
                            
                            Button {
                                if counter == questions.count {
                                    if !UserDefaults.standard.bool(forKey: "firstGame") {
                                        var levelsCompleted = UserDefaults.standard.integer(forKey: "levelsCompleted")
                                        levelsCompleted += 1
                                        UserDefaults.standard.setValue(levelsCompleted, forKey: "levelsCompleted")
                                        UserDefaults.standard.setValue(true, forKey: "firstGame")
                                    }
                                }
                                managment.coins += coins
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
                .padding()
                
                Spacer()
            }
        }
    }
    
    private func goToNextQuestion() {
        // Переход к следующему вопросу
        selectedAnswer = nil
        showFeedback = false
        currentQuestionIndex += 1
    }
}


#Preview {
    FirstGameView(questions: DataManager.shared.quizQuestions, managment: Managment())
}
