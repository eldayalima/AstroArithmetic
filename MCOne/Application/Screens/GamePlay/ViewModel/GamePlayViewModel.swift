//
//  GamePlayViewModel.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import Foundation

@MainActor
class GamePlayViewModel: ObservableObject {
    @Published var listQuestion: [[QuestionModel]] = []
    @Published var isShowAlert: Bool = false
    @Published var isShowCorrectAlert: Bool = false
    @Published var sumCorrectAns: [String] = []
    @Published var isGameFinished: Bool = false
    @Published var confirmReplayGame: Bool = false
    @Published var imageName: String = "helmet3"
    @Published var showAddView = false
    @Published var isOpenGuidance: Bool = true
    
    init(){
        imageName = randomImageName()
        generateRandomNum()
    }
    
    func generateRandomNum(){
        var randomNumber_ : [[QuestionModel]] = []
        
        for _ in 0..<4 {
            var arrNumTemp: [QuestionModel] = []
            for _ in 0..<4{
                let tempNum1 = Int.random(in: 1..<10)
                let tempNum2 = Int.random(in: 1..<10)
                let resTemp = tempNum1 + tempNum2
                let tempData = QuestionModel(num1: tempNum1, num2: tempNum2, resAdd: resTemp)
                arrNumTemp.append(tempData)
            }
            randomNumber_.append(arrNumTemp)
            arrNumTemp.removeAll()
        }
        listQuestion = randomNumber_
    }
    
    func hideAlert (timer: Int) async{
        try? await Task.sleep(for: .seconds(timer))
        isShowAlert=false
        isShowCorrectAlert=false
    }
    
    func randomImageName() -> String {
        let imageNames = ["helmet3", "Astronout","Glove", "Shoes", "Suit"]
        let imageName = imageNames.randomElement() ?? "helmet3"
        return imageName
    }
    
}
