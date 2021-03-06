//
//  FAQTableViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/2/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit

class FAQTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    let allQuestions = FAQs.allQuestions

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allQuestions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCell", for: indexPath)
        let FAQCell = self.allQuestions[indexPath.row]
        
        cell.textLabel?.text = FAQCell.question

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "AnswersViewController") as! AnswersViewController
        detailController.faqs = self.allQuestions[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
}
