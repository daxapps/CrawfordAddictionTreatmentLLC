//
//  FAQs.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/2/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import Foundation
import UIKit


struct FAQs {
    
    // MARK: Properties
    
    let question: String
    let answer: String
    
    static let QuestionKey = "QuestionKey"
    static let AnswerKey = "AnswerKey"
    
    // MARK: Initializer
    
    init(dictionary: [String:String]) {
        self.question = dictionary[FAQs.QuestionKey]!
        self.answer = dictionary[FAQs.AnswerKey]!
    }
}

extension FAQs {
    
    static var allQuestions: [FAQs] {
        var qnaArray = [FAQs]()
        for q in FAQs.localQnAData() {
            qnaArray.append(FAQs(dictionary: q))
        }
        return qnaArray
    }
    
    static func localQnAData() -> [[String: String]] {
        return [
            [FAQs.QuestionKey : "How do I know if a loved one or myself is addicted to pain medicine?", FAQs.AnswerKey : "Increase in usage, changes in personality and behavior, emotional withdrawal"],
            [FAQs.QuestionKey : "How are you today?", FAQs.AnswerKey : "I'm doing great if this works."]
        ]
    }
}








