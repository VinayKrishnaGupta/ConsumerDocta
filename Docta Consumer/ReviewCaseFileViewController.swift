//
//  ReviewCaseFileViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 25/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class ReviewCaseFileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.estimatedRowHeight = UITableViewAutomaticDimension
        TableView.rowHeight = UITableViewAutomaticDimension
        TableView.setNeedsLayout()
        TableView.layoutIfNeeded()
        TableView.tableFooterView = UIView()
        TableView.tableHeaderView = UIView()
        print("How long is \(ReviewCasefileManager.sharedInstance.HowLong)")
        print("Question 1 is \(ReviewCasefileManager.sharedInstance.Q1WhyneedSpecialist)")
        print("Question 2 is \(ReviewCasefileManager.sharedInstance.Q2HowProblemStart)")
        print("Questions 3 is \(ReviewCasefileManager.sharedInstance.Q3Symptoms)")
        print("Question 4 is \(ReviewCasefileManager.sharedInstance.Q4TreatmentHistory)")
        print("Question 5 is \(ReviewCasefileManager.sharedInstance.Q5MedicalConditions)")
        print("Questions 6 is \(ReviewCasefileManager.sharedInstance.Q6AddtionalInformation)")
        self.navigationItem.title = "Review Your Case File"
        self.navigationItem.hidesBackButton = true

        

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        if section == 1 {
            return 6
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.justified
        let titleAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: .headline), NSForegroundColorAttributeName: UIColor.darkGray]
        let subtitleAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: .subheadline),NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:style]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        
        titleString.append(subtitleString)
        
        return titleString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
           
            let cell2 = TableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
            switch indexPath.row {
            case 0:
                cell2.textLabel?.attributedText = makeAttributedString(title: "Patient Name ", subtitle: ReviewCasefileManager.sharedInstance.S49PatientName)
            case 1:
                cell2.textLabel?.attributedText = makeAttributedString(title: "Patient Age ", subtitle: String(ReviewCasefileManager.sharedInstance.S50PatientAge))
                
            case 2:
                cell2.textLabel?.attributedText = makeAttributedString(title: "Patient Gender ", subtitle: ReviewCasefileManager.sharedInstance.S48PatientGender)
                
            case 3:
                cell2.textLabel?.attributedText = makeAttributedString(title: "Patient Nationality ", subtitle: ReviewCasefileManager.sharedInstance.S51PatientNationality)
                
                
            default:
                break
            }
            return cell2
        }
        if indexPath.section == 2 {
          
            let footerCell = tableView.dequeueReusableCell(withIdentifier: "CellFooter", for: indexPath) as! NextBackButtonsTableViewCell
            footerCell.nextButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
            footerCell.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
            footerCell.infoButton.addTarget(self, action: #selector(InfoButton), for: .touchUpInside)
            footerCell.nextButton.titleLabel?.text = "Submit"
            footerCell.infoButton.isHidden = true
            
            return footerCell
        }
        else {
            
            let cell3 = TableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
            if indexPath.section == 1 {
                
                switch indexPath.row {
                case 0:
                    cell3.textLabel?.attributedText = makeAttributedString(title: "Why do you need a specialist? ", subtitle: ReviewCasefileManager.sharedInstance.Q1WhyneedSpecialist)
                    

                case 1:
                    cell3.textLabel?.attributedText = makeAttributedString(title: "How did this problem start? ", subtitle:ReviewCasefileManager.sharedInstance.Q2HowProblemStart)
                case 2:
                    cell3.textLabel?.attributedText = makeAttributedString(title: "What are the symptoms? ", subtitle: ReviewCasefileManager.sharedInstance.Q3Symptoms)
                    
                case 3:
                    cell3.textLabel?.attributedText = makeAttributedString(title: "What treatment have you had? ", subtitle: ReviewCasefileManager.sharedInstance.Q4TreatmentHistory)
                    
                case 4:
                    cell3.textLabel?.attributedText = makeAttributedString(title: "Do you have any medical conditions? ", subtitle: ReviewCasefileManager.sharedInstance.Q5MedicalConditions)
                    
                case 5:
                    cell3.textLabel?.attributedText = makeAttributedString(title: "Any additional information? ", subtitle: ReviewCasefileManager.sharedInstance.Q6AddtionalInformation)
                
                default:
                    break
                }

            }
            return cell3
        }
        
        
        
        
        
        
       
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.text = self.tableView(tableView, titleForHeaderInSection: section)
        header.textLabel?.font = UIFont(name: "Rubik-Medium", size: 20)
        header.textLabel?.textAlignment = NSTextAlignment.left
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Patient Profile"
        }
        if section == 1 {
            return "Case file"
        }
        else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return 70
        }
        else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 20
        case 1:
            return 30
        default:
            return 0
        }
        
    }
    
    func nextButton(){
        self.createCaseFile()
        
    }
    func backButton(){
        self.navigationController?.popViewController(animated: true)
        
        
    }
    func InfoButton(){
        
        
    }
    
    func createCaseFile() {
        let SharedPreferences = ReviewCasefileManager.sharedInstance
        let parameter = [
          "user_type": SharedPreferences.S41TypeofUser ,
          "user_firstname": SharedPreferences.S42FirstName,
          "user_lastname": SharedPreferences.S43LastName,
          "user_email": SharedPreferences.S44Email,
          "user_phone": SharedPreferences.S47PhoneNumber,
          "user_password": SharedPreferences.S45Password,
          "looking": "Consultation",
          "why": SharedPreferences.Q1WhyneedSpecialist,
          "problem": SharedPreferences.HowLong,
          "start": SharedPreferences.Q2HowProblemStart,
          "symptoms": SharedPreferences.Q3Symptoms,
          "treatment": SharedPreferences.Q5MedicalConditions,
          "specialist": SharedPreferences.SelectedSpecialist.value(forKey: "_id"),
          "history": SharedPreferences.Q4TreatmentHistory,
          "patient_age": SharedPreferences.S50PatientAge,
          "patient_nationality": SharedPreferences.S51PatientNationality,
          "patient_name": SharedPreferences.S49PatientName,
          "patient_gender": SharedPreferences.S48PatientGender,
          "additional_information": SharedPreferences.Q6AddtionalInformation,
          "body_files": SharedPreferences.ImageArrayBodyparts,
          "report_files": SharedPreferences.ImageArrayReportsAndReferral,
          "speciality": SharedPreferences.SpecialityIDSelected]
    
        
        
        
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
