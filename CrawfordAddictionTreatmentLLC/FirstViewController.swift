//
//  FirstViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/2/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var callButton: UIButton!
    
    @IBAction func onlineAppointmentButton(_ sender: Any) {
        if let url = URL(string: "http://johncrawfordmd.com/online-appointments/") {
            UIApplication.shared.open(url)
        }
    }
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


}

