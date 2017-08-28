//
//  ReviewCaseFileViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 25/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class ReviewCaseFileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("How long is \(ReviewCasefileManager.sharedInstance.HowLong)")
        print("Question 1 is \(ReviewCasefileManager.sharedInstance.Q1WhyneedSpecialist)")
        print("Question 2 is \(ReviewCasefileManager.sharedInstance.Q2HowProblemStart)")
        print("Questions 3 is \(ReviewCasefileManager.sharedInstance.Q3Symptoms)")
        print("Question 4 is \(ReviewCasefileManager.sharedInstance.Q4TreatmentHistory)")
        print("Question 5 is \(ReviewCasefileManager.sharedInstance.Q5MedicalConditions)")
        print("Questions 6 is \(ReviewCasefileManager.sharedInstance.Q6AddtionalInformation)")

        

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
