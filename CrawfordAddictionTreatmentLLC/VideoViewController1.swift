//
//  VideoViewController1.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/11/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController1: UIViewController, WKUIDelegate {

    @IBOutlet weak var firstVideo: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstYoutubeVideo(videoID: "t2mmgcvoX40")

    }

    func loadFirstYoutubeVideo(videoID:String) {
        let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        let myRequest = URLRequest(url: youtubeURL!)
        firstVideo.loadRequest(myRequest)
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        //activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        print("did startLoad")
    }
    
    func webViewDidFinishLoad(_ webView:UIWebView) {
        //activityIndicator.isHidden = false
        activityIndicator.stopAnimating()
        print("did finishLoad")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
    }
    

}
