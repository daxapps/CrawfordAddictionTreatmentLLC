//
//  HelpfulLinksViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/12/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit

class HelpfulLinksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func GoodRxButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://m.goodrx.com") {
                        UIApplication.shared.open(url)
                    }
    }

    @IBAction func AAMeetingsButtonPressed(_ sender: Any) {
        if let url = URL(string: "http://www.aa.org/pages/en_US/find-local-aa") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func NAMeetingsButtonPressed(_ sender: Any) {
        if let url = URL(string: "http://www.naws.org/meetingsearch/") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func GemmasStoryButtonPressed(_ sender: Any) {
        if let url = URL(string: "http://m.theepochtimes.com/n3/640081-suboxone-a-double-edged-sword/?photo=3") {
            UIApplication.shared.open(url)
        }
    }

    @IBAction func SuboxoneButtonPressed(_ sender: Any) {
        if let url = URL(string: "http://m.suboxone.com") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func SuboxoneForumButtonPressed(_ sender: Any) {
        if let url = URL(string: "http://www.suboxforum.com/") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func SAMHSAButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.samhsa.gov/") {
            UIApplication.shared.open(url)
        }
    }

    
    
    
}
