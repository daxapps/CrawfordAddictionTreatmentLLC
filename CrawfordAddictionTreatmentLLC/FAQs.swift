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
            [FAQs.QuestionKey : "How do I know if a loved one or myself is addicted to pain medicine?", FAQs.AnswerKey : "Increase in usage, changes in personality and behavior, emotional withdrawal, continuing use after symptoms clear, spend more time seeking painkillers, and neglecting responsibilities."],
            [FAQs.QuestionKey : "How can Crawford Addiction Treatment help with pain medicine addiction?", FAQs.AnswerKey : "Dr. Crawford will evaluate the patient and assess if a self-directed outpatient program that prescribes Suboxone(buprenorphine/naloxone) such as Crawford Addiction Treatment, will be appropriate for the patient's needs.  If the patient fits our program, they will receive a prescription that day.  The patient can fill this prescription at any pharmacy of their choice.  They can take the medicine and return to work the same day.  They will be more stable than when they were taking pain killers(no more rollercoaster effect)."],
            [FAQs.QuestionKey : "How long does the treatment last?", FAQs.AnswerKey : "Suboxone is designed as a stepping stone to help patients wean off of pain killers and eventually stop using opiates completely.  Ideally a patient would take 6-12 months to wean off of Suboxone completely."],
            [FAQs.QuestionKey : "What is Suboxone?", FAQs.AnswerKey : "Suboxone is a prescription medicine that contains the active ingredients buprenorphine and naloxone. It is used to treat adults who are dependent on (addicted to) opioids (either prescription or illegal)."],
            [FAQs.QuestionKey : "What are opiates?", FAQs.AnswerKey : "Opiates are a group of drugs that are used for treating pain. They are derived from opium which comes from the poppy plant. Opiates go by a variety of names including opiates, opioids, and narcotics. The term opiates is sometimes used for close relatives of opium such as codeine, morphine and heroin, while the term opioids is used for the entire class of drugs including synthetic opiates such as Oxycontin."],
            [FAQs.QuestionKey : "How much do the visits cost?", FAQs.AnswerKey : "Dr Crawford will meet with the patient every four weeks.  Each visit cost $300.  In order to get started, the patient has the option of a two week visit for $190.  Drug screens are included in the cost of the visit."],
            [FAQs.QuestionKey : "Does Crawford Addiction Treatment accept insurance for the visit?", FAQs.AnswerKey : "We currently only accept cash, debit cards, or credit cards for payment.  The debit or credit card needs to have the patients name printed on it.  If the card has someone else's name on it, they need to be present to sign for it.  The card also needs a Visa, Mastercard, Discover, or American Express logo on it."],
            [FAQs.QuestionKey : "How much does Suboxone cost?", FAQs.AnswerKey : "The cost of the medicine can vary greatly.  The Suboxone film tends to be more expensive than the generic buprenorphine/naloxone pill.  Patients usually start out taking one 8mg/2mg film/pill a day. "]
        ]
    }
}








