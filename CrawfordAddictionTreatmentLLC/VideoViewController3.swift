//
//  VideoViewController3.swift
//  CrawfordAddictionTreatmentLLC
//
//  Created by Jason Crawford on 1/11/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import WebKit

class VideoViewController3: UIViewController, WKUIDelegate {

    @IBOutlet weak var thirdVideo: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstYoutubeVideo(videoID: "oyVR9fqkxUU")
        
    }
    
    func loadFirstYoutubeVideo(videoID:String) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        thirdVideo.loadRequest( URLRequest(url: youtubeURL) )
    }

}
