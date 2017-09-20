//
//  Step2IntroViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 15/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class Step2IntroViewController: UIViewController {
    @IBOutlet weak var titleLabelSpeciality: UILabel!
    @IBOutlet weak var detailTextViewSpeciality: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.titleLabelSpeciality.text = ReviewCasefileManager.sharedInstance.SpecialistyName
        self.detailTextViewSpeciality.text = ReviewCasefileManager.sharedInstance.SelectedSpecialityDescription
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
        
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
