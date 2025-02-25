//
//  DataManager.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import Foundation

struct QuizQuestion {
    let question: String
    let answers: [String]
    let rightAnswer: Int
}

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    let quizQuestions: [QuizQuestion] = [
        QuizQuestion(
            question: "What was the capital of ancient Lydia during the reign of King Cresus?",
            answers: ["Sardis", "Ephesus", "Miletus", "Pergamon"],
            rightAnswer: 0
        ),
        QuizQuestion(
            question: "What was King Cresus famous for?",
            answers: ["His military conquests", "His incredible wealth", "His philosophical teachings", "His architectural achievements"],
            rightAnswer: 1
        ),
        QuizQuestion(
            question: "Which river was believed to have 'golden sands' and contributed to Lydia's wealth?",
            answers: ["Tigris", "Halys", "Pactolus", "Meander"],
            rightAnswer: 2
        ),
        QuizQuestion(
            question: "What significant financial innovation is attributed to the Lydians?",
            answers: ["The first banks", "The first paper money", "The first coins", "The first credit system"],
            rightAnswer: 2
        ),
        QuizQuestion(
            question: "Which famous Greek philosopher visited King Cresus and warned him about the unpredictability of fortune?",
            answers: ["Aristotle", "Socrates", "Thales", "Solon"],
            rightAnswer: 3
        ),
        QuizQuestion(
            question: "Which Persian king defeated Cresus and conquered Lydia?",
            answers: ["Cyrus the Great", "Darius I", "Xerxes I", "Cambyses II"],
            rightAnswer: 0
        ),
        QuizQuestion(
            question: "What major sanctuary in Sardis was dedicated to the goddess Cybele?",
            answers: ["The Temple of Artemis", "The Temple of Athena", "The Temple of Apollo", "The Temple of Artemis at Sardis"],
            rightAnswer: 3
        ),
        QuizQuestion(
            question: "According to legend, what did the Oracle of Delphi tell Cresus before his war with Persia?",
            answers: ["A great empire will fall", "You will rule all of Asia", "Beware the wrath of Zeus", "You are destined to be king of kings"],
            rightAnswer: 0
        ),
        QuizQuestion(
            question: "What metal alloy were the first Lydian coins made of?",
            answers: ["Bronze", "Electrum", "Silver", "Copper"],
            rightAnswer: 1
        ),
        QuizQuestion(
            question: "After Cresus' defeat, how did Cyrus the Great supposedly treat him?",
            answers: ["He executed him", "He made him a Persian governor", "He spared him and made him an advisor", "He exiled him to Greece"],
            rightAnswer: 2
        )
    ]
}
