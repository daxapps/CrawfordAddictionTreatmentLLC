//
//  BupChat2ViewController.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/5/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import Firebase

class BupChat2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var messages: [FIRDataSnapshot]! = [FIRDataSnapshot]()
    
    var ref: FIRDatabaseReference!
    private var _refHandle: FIRDatabaseHandle!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //logout
        /* let firebaseAuth = FIRAuth.auth()
         do {
         try firebaseAuth?.signOut()
         } catch let signOutError as NSError {
         print("error signing out")
         } */
        
        if (FIRAuth.auth()?.currentUser == nil) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "firebaseLoginViewController")
            self.navigationController?.present(vc!, animated: true, completion: nil)
        }
        subscribeToKeyboardNotifications()
    }
    
    deinit {
        self.ref.child("messages").removeObserver(withHandle: _refHandle)
    }
    
    func ConfigureDatabase () {
        ref = FIRDatabase.database().reference()
        
        _refHandle = self.ref.child("messages").observe(.childAdded, with: {(snapshot) -> Void in
            
            self.messages.append(snapshot)
            self.tableView.insertRows(at: [IndexPath(row: self.messages.count-1, section: 0)], with: .automatic)
            
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        let messageSnap: FIRDataSnapshot! = self.messages[indexPath.row]
        let message = messageSnap.value as! Dictionary<String, String>
        if let text = message[Constants.MessageFields.text] as String! {
            cell.textLabel?.text = text
        }
        if let subText = message[Constants.MessageFields.dateTime] {
            cell.detailTextLabel?.text = subText
        }
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.textField.delegate = self
        
        ConfigureDatabase()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(BupChat2ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(BupChat2ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
        
    }
    
    func SendMessage(data: [String: String]) {
        var packet = data
        packet[Constants.MessageFields.dateTime] = Utilities().GetDate()
        self.ref.child("messages").childByAutoId().setValue(packet)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
        unsubscribeFromKeyboardNotifications()
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(BupChat2ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BupChat2ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(_ notification: NSNotification) {
        resetViewFrame()
        if textField.isFirstResponder {
            view.frame.origin.y = getKeyboardHeight(notification) * -1
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        if textField.isFirstResponder {
            resetViewFrame()
        }
    }
    
    func resetViewFrame(){
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
//    func keyboardWillHide (_ sender: Notification) {
//        let userInfo: [NSObject:AnyObject] = (sender as NSNotification).userInfo! as [NSObject : AnyObject]
//        
//        //let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.cgRectValue().size
//        let keyboardSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.cg
//        self.view.frame.origin.y += keyboardSize.height
//        if keyboardOnScreen {
//                        self.view.frame.origin.y += self.keyboardHeight(Notification)
//                    }
        
        //view.frame.origin.y = 0
//    }
    

    
    //func keyboardWillShow(_ sender: NSNotification) {
//        let userInfo: [NSObject:Any] = sender.userInfo! as [NSObject : Any]
//        
//        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.cgRectValue().size
//        let offset: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]!.cgRectValue().size
//        
//        if keyboardSize.height == offset.height {
//            if self.view.frame.origin.y == 0 {
//                UIView.animate(withDuration: 0.15, animations: {
//                    self.view.frame.origin.y -= keyboardSize.height
//                })
//            }
//        }
//        else {
//            UIView.animate(withDuration: 0.15, animations: {
//                self.view.frame.origin.y += keyboardSize.height - offset.height
//            })
//        }
//        if !keyboardOnScreen {
//            self.view.frame.origin.y += self.keyboardHeight(NSNotification)
        
        //        view.frame.origin.y = 0
        //view.frame.origin.y = getKeyboardHeight(notification) * -1
    //}
    
//    func getKeyboardHeight(_ notification: NSNotification) -> CGFloat {
//        let userInfo = notification.userInfo
//        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
//        return keyboardSize.cgRectValue.height
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
//        if (textField.text?.characters.count == 0) {
//            return true
//        }
//        
//        let data = [Constants.MessageFields.text: textField.text! as String]
//        SendMessage(data: data)
//        print("ended editing")
//        textField.text = ""
//        self.view.endEditing(true)
        textField.resignFirstResponder()
        let data = [Constants.MessageFields.text: textField.text! as String]
        SendMessage(data: data)
        textField.text = ""
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
