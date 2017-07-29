//
//  ChatTabBar2ViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 27/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class ChatTabBar2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func StartChatButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ChatMain", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ChannelListVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
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
