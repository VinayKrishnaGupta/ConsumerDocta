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

    override func viewDidLoad() {
        super.viewDidLoad()
         self.playvideo()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    func playvideo() {
        
        let videoURL:URL = URL(string: "https://archive.org/download/ksnn_compilation_master_the_internet/ksnn_compilation_master_the_internet_512kb.mp4")!
        let player = AVPlayer.init(url: videoURL)
        let controller = AVPlayerViewController()
        controller.player = player
        self.addChildViewController(controller)
       // let screenSize = UIScreen.main.bounds.size
        let videoFrame = CGRect(x: 0, y: 10, width: self.view.frame.size.width, height:self.view.frame.size.height/2)
        controller.view.frame = videoFrame
        self.view.addSubview(controller.view)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
