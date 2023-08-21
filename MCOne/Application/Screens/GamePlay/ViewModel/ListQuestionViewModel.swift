//
//  ListQuestionViewModel.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import Foundation

class ListQuestionViewModel: ObservableObject {
    @Published var listQuestion: [[QuestionModel]] = []
    @Published var isShowAlert: Bool = false
    @Published var isShowCorrectAlert: Bool = false
    @Published var sumCorrectAns: [String] = []
    @Published var isGameFinished: Bool = false
    @Published var confirmReplayGame: Bool = false
    @Published var imageName: String = "helmet3"
    @Published private var showAddView = false
    @Published var isOpenGuidance: Bool = true
}
