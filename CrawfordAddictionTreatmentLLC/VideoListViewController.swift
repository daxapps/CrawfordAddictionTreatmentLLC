//
//  VideoListViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/11/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit

class VideoListViewController: UIViewController {

    @IBAction func video1Pressed(_ sender: Any) {

    }
    

}

extension UIViewController {
    
    // MARK: Alert
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
            alert.addAction(dismissAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
