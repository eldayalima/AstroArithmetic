//
//  ListQuestionModel.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import Foundation


class ListQuestion: ObservableObject {
    @Published var listQuestion: [Question] = []
    
    func randomQuestions(){
        var tempAnswers: [Int] = []
        
        for _ in 1...16 {
            var temp = generateOneQuestion()
            
            while tempAnswers.contains(temp.hasil){
                temp = generateOneQuestion()
            }
            tempAnswers.append(temp.hasil)
            let question = Question(quest: temp.soal, res: temp.hasil)
            listQuestion.append(question)
        }
    }
    
    private func generateOneQuestion() -> (soal: String, hasil: Int){
        var str = ""
        var hasil = 0
        let num1 = Int.random(in: 0...10)
        let num2 = Int.random(in: 0...10)
        
        str =  "\(num1) + \(num2)"
        
        hasil = num1 + num2
        
        return (str, hasil)
        
    }
    
}
