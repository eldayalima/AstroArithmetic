//
//  QuestionModel.swift
//  MCOne
//
//  Created by Elwin Johan Sibarani on 20/08/23.
//

import Foundation

struct QuestionModel {
    var id: String = UUID().uuidString
    var num1: Int
    var num2: Int
    var resAdd: Int
    var isCorrect: Bool = false
}
