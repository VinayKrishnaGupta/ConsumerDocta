//
//  AVViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 23/10/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AVViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let caseID:String = ReviewCasefileManager.sharedInstance.CasefileSelected.value(forKeyPath: "_id") as! String
        let videoURL:URL = URL(string: "https://account.docta.com/api/case/video/" + caseID)!
        let token : String  = (UserDefaults.standard.object(forKey: "AccessToken")) as! String
        
        let headers = ["Authorization":"Bearer \(token)","Accept":"application/json","Content-Type":"application/json" ]
        
        
        let player = AVPlayer.init(url: videoURL)
        let player2 : AVURLAsset = AVURLAsset.init(url: videoURL, options: ["AVURLAssetHTTPHeaderFieldsKey":headers])
        let playeritem : AVPlayerItem = AVPlayerItem.init(asset: player2)
        player.replaceCurrentItem(with: playeritem)
        
        
        self.player = player
     
        print("Current Item is \(player.currentItem)")
        self.player?.play()
        self.showsPlaybackControls = true
        
        //   self.videoView.addSubview(Videocontroller.view)
        //   Videocontroller.view.frame = videoView.frame
        
        // let screenSize = UIScreen.main.bounds.size
        //       let videoFrame = CGRect(x: 0, y: 70, width: self.view.frame.size.width, height:self.view.frame.size.height*0.4)
        //
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
