//
//  FAQs.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/2/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import Foundation
import UIKit


struct QnA {
    
    // MARK: Properties
    
    let question: String
    let answer: String
    
    static let QuestionKey = "QuestionKey"
    static let AnswerKey = "AnswerKey"
    
    // MARK: Initializer
    
    init(dictionary: [String:String]) {
        self.question = dictionary[QnA.QuestionKey]!
        self.answer = dictionary[QnA.AnswerKey]!
    }
}

extension QnA {
    
    static var allQuestions: [QnA] {
        var qnaArray = [QnA]()
        for q in QnA.localQnAData() {
            qnaArray.append(QnA(dictionary: q))
        }
        return qnaArray
    }
    
    static func localQnAData() -> [[String: String]] {
        return [
            [QnA.QuestionKey : "How do I know if a loved one or myself is addicted to pain medicine?", QnA.AnswerKey : "Increase in usage, changes in personality and behavior, emotional withdrawal"]
        ]
    }
}








