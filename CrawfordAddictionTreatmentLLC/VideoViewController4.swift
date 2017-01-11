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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstYoutubeVideo(videoID: "6qrwblxhfUY")
        
    }
    
    func loadFirstYoutubeVideo(videoID:String) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        forthVideo.loadRequest( URLRequest(url: youtubeURL) )
    }
    
}

