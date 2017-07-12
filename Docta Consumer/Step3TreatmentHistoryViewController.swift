//
//  Step3TreatmentHistoryViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import FileBrowser

class Step3TreatmentHistoryViewController: UIViewController {
    let fileBrowser = FileBrowser()

    override func viewDidLoad() {
        super.viewDidLoad()
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsURL = paths[0] as NSURL

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func uploadFileButton(_ sender: UIButton) {
        
        present(fileBrowser, animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "step4Location", sender: sender)
        
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
