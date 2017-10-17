//
//  OnlineReportsViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/10/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class OnlineReportsViewController: UIViewController {
    @IBOutlet weak var nextStepsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let Videocontroller = AVPlayerViewController()
    var VideoFile = String()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.playvideo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let caseID:String = ReviewCasefileManager.sharedInstance.CasefileSelected.value(forKeyPath: "_id") as! String
        let APIsession : APIHandler = APIHandler()
        APIsession.getDatafromAPI("POST", "casefile/\(caseID)", nil) { (response, error) in
            if (response != nil) {
                print(response as Any)
                let json : NSDictionary = response as! NSDictionary
                let reportDesription : String = json.value(forKeyPath: "data.report.content") as! String
              // self.VideoFile = json.value(forKeyPath: "data.videoFile") as! String
               // let nextSteps: String = json.value(forKeyPath: "data.next_steps") as! String
             //   self.nextStepsLabel.text = nextSteps
                self.descriptionLabel.text = reportDesription
                
                
                
            }
            else {
                print(error as Any)
                
            }
        }
    }
    
    func playvideo() {
        
        
        let videoURL:URL = URL(string: "https://archive.org/download/ksnn_compilation_master_the_internet/ksnn_compilation_master_the_internet_512kb.mp4")!
       //  let videoURL:URL = URL(string: "https://")!
         let token  = (UserDefaults.standard.object(forKey: "AccessToken"))
        let headers = ["Authorization":"Bearer \(token)","accept":"application/json","Content-Type":"application/json" ]
        
        
        let player = AVPlayer.init(url: videoURL)
        let player2 = AVURLAsset.init(url: videoURL, options: ["AVURLAssetHTTPHeaderFieldsKey":headers])
        let playeritem = AVPlayerItem.init(asset: player2)
        
       // let controller = AVPlayerViewController()
        Videocontroller.player?.replaceCurrentItem(with: playeritem)
       // Videocontroller.player = player
        Videocontroller.showsPlaybackControls = true
       
        self.addChildViewController(Videocontroller)
       // let screenSize = UIScreen.main.bounds.size
        let videoFrame = CGRect(x: 0, y: 70, width: self.view.frame.size.width, height:self.view.frame.size.height/2)
        
        Videocontroller.view.frame = videoFrame
        self.view.addSubview(Videocontroller.view)
        player.play()
        
        
//        let videoURL = URL(string: "https://www.youtube.com/watch?v=uKuO3jbD7LY")
//        let player = AVPlayer(url: videoURL!)
//        let playerViewController = AVPlayerViewController()
//        playerViewController.player = player
//        self.present(playerViewController, animated: true) {
//            playerViewController.player!.play()
//
//        }
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Videocontroller.player?.pause()
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
