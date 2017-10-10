//
//  ReviewCaseFileViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 25/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD

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
//        print("How long is \(ReviewCasefileManager.sharedInstance.HowLong)")
//        print("Question 1 is \(ReviewCasefileManager.sharedInstance.Q1WhyneedSpecialist)")
//        print("Question 2 is \(ReviewCasefileManager.sharedInstance.Q2HowProblemStart)")
//        print("Questions 3 is \(ReviewCasefileManager.sharedInstance.Q3Symptoms)")
//        print("Question 4 is \(ReviewCasefileManager.sharedInstance.Q4TreatmentHistory)")
//        print("Question 5 is \(ReviewCasefileManager.sharedInstance.Q5MedicalConditions)")
//        print("Questions 6 is \(ReviewCasefileManager.sharedInstance.Q6AddtionalInformation)")
        self.navigationItem.title = "Review"
        self.navigationItem.hidesBackButton = true

        

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 4 {
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
           
                cell2.textLabel?.attributedText = makeAttributedString(title: "Patient Name ", subtitle: ReviewCasefileManager.sharedInstance.S49PatientName)
                return cell2
        }
        
        //PatientProfile
        if indexPath.section == 1 {
            let patientprofileCell = tableView.dequeueReusableCell(withIdentifier: "PatientProfile", for: indexPath) as! PatientProfileTableViewCell
            
            
            patientprofileCell.patientAge.text = String(ReviewCasefileManager.sharedInstance.S50PatientAge)
            patientprofileCell.patientGender.text = ReviewCasefileManager.sharedInstance.S48PatientGender
            patientprofileCell.PAtientNationality.text = ReviewCasefileManager.sharedInstance.S51PatientNationality
            patientprofileCell.GenderLabel.text = "Gender"
            patientprofileCell.AgeLabel.text = "Age"
            patientprofileCell.NationalityLabel.text = "Nationality"
            
            
            
            return patientprofileCell
        }
        
        
        if indexPath.section == 2 {
            let imagecell = tableView.dequeueReusableCell(withIdentifier: "ImagesCell", for: indexPath) as! ImageCollectionTableViewCell
            imagecell.HideCameraButton = true
            imagecell.imagearray = ReviewCasefileManager.sharedInstance.ImageArrayBodyparts
            
            return imagecell
        }
        
        if indexPath.section == 3 {
            let imagecell2 = tableView.dequeueReusableCell(withIdentifier: "ImagesCellreferal", for: indexPath) as! ImageCollectionTableViewCell
            imagecell2.HideCameraButton = true
           
            imagecell2.imagearray = ReviewCasefileManager.sharedInstance.ImageArrayReportsAndReferral
            return imagecell2
        }
        
        
        
        
        if indexPath.section == 5 {
          
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
            if indexPath.section == 4 {
                
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
        if section == 2 {
            return "Symptoms images"
        }
        
        if section == 4 {
            return "Case file"
        }
        if section == 3 {
            return "Reports and Referrals"
        }
            
        else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5 {
            return 70
        }
        if indexPath.section == 2 {
            return 100
        }
        if indexPath.section == 3 {
            return 100
        }
        if indexPath.section == 1 {
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
        case 2:
            return 30
        case 3:
            return 30
        case 4:
            return 30
        case 1:
            return -10
        default:
            return 0
        }
        
    }
    
    func nextButton(){
        SVProgressHUD.show(withStatus: "Submitting your details, Please wait")
        self.createCaseFile()
        
    }
    func backButton(){
        self.navigationController?.popViewController(animated: true)
        
        
    }
    func InfoButton(){
        
        
    }
    
    
    
    
    func createCaseFile() {
        
        var BodyPartsImages = Array<Any>()
        var ReportsandReferalImages = Array<Any>()
        for var i in (0..<ReviewCasefileManager.sharedInstance.ImageArrayBodyparts.count) {
            let image : UIImage = ReviewCasefileManager.sharedInstance.ImageArrayBodyparts[i]
           
            let imageData : NSData = UIImagePNGRepresentation(image)! as NSData
            let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            BodyPartsImages.append(strBase64)
         
        }
        for var j in (0..<ReviewCasefileManager.sharedInstance.ImageArrayReportsAndReferral.count) {
            let image1 : UIImage = ReviewCasefileManager.sharedInstance.ImageArrayReportsAndReferral[j]
            
            let imageData1 : NSData = UIImagePNGRepresentation(image1)! as NSData
            let str1Base64 = imageData1.base64EncodedString(options: .lineLength64Characters)
            ReportsandReferalImages.append(str1Base64)
            
        }
        
        
        
        
     
        
        
        
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
          "body_files": BodyPartsImages,
          "report_files": ReportsandReferalImages,
          "speciality": SharedPreferences.SpecialityIDSelected]
        
    
        
        let SendingBody = [
            
            "case_data": parameter
        ] as [String : Any]
        
        let APIsession : APIHandler = APIHandler()
        APIsession.getDatafromAPI("POST", "create", SendingBody) { (response, error) in
            if (response != nil) {
                print(response)
                SVProgressHUD.dismiss()
                SVProgressHUD.show(withStatus: "Your Case file has been created")
                SVProgressHUD.dismiss(withDelay: 2)
                self.navigationController?.popToRootViewController(animated: true)
            }
            if (error != nil) {
                print("Error is \(String(describing: error))")
                SVProgressHUD.showError(withStatus: "Error in creating casefile")
                SVProgressHUD.dismiss(withDelay: 2)
                
            }
        }
        

        
        
        
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
