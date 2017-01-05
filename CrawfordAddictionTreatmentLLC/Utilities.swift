//
//  Utilities.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/5/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    func ShowAlert (title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func GetDate () -> String {
        let today: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter.string(from: today)
    }
    
}
