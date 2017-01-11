//
//  VideoViewController2.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/11/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController2: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var secondVideo: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstYoutubeVideo(videoID: "LHGzXzoNQD0")
        
    }
    
    func loadFirstYoutubeVideo(videoID:String) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        secondVideo.loadRequest( URLRequest(url: youtubeURL) )
    }

}
