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
    
    func getDate () -> String {
        let today: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter.string(from: today)
    }
    
}
