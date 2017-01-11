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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstYoutubeVideo(videoID: "t2mmgcvoX40")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadFirstYoutubeVideo(videoID:String) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        firstVideo.loadRequest( URLRequest(url: youtubeURL) )
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
