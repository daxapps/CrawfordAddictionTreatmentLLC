//
//  FirstViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/2/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import MessageUI

class FirstViewController: UIViewController {

    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var textUsButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeCall(_ sender: Any) {
        let url = URL(string: "telprompt://3379359222")!
        UIApplication.shared.open(url)
    }

    @IBAction func sendTextMessageButtonPressed(_ sender: Any) {
        
        let url = URL(string: "sms:3379359222")!
        UIApplication.shared.open(url)
        
    }
    
}





