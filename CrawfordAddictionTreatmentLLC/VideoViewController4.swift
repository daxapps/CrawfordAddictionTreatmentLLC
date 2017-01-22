//
//  VideoViewController4.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/11/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController4: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var forthVideo: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutubeVideo(videoID: "6qrwblxhfUY")
    }
    
    func loadYoutubeVideo(videoID:String) {
        let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        let myRequest = URLRequest(url: youtubeURL!)
        forthVideo.loadRequest(myRequest)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
        print("did startLoad")
    }
    
    func webViewDidFinishLoad(_ webView:UIWebView) {
        activityIndicator.stopAnimating()
        print("did finishLoad")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        showAlert(title: "Unable to Load Video", message: "Check Internet Connection")
        activityIndicator.stopAnimating()
    }
    
}

