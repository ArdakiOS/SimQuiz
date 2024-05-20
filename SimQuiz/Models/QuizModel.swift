//
//  QuizModel.swift
//  SimQuiz
//
//  Created by Ardak Tursunbayev on 28.04.2024.
//

import Foundation

struct QuizModel : Codable {
    var prg : Int
    let questions : [questionModel]
}

struct questionModel : Codable {
    let question : String
    let answers : [String]
    let correctAns : String
}
