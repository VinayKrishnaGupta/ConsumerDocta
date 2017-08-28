//
//  Step2TreatmentHistoryViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 14/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class Step2TreatmentHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,OpenCameraProtocol {
    @IBOutlet weak var tableView: UITableView!
    public var SelectedLocationText2 : String = ""
    public var SelectedSpecialities2 : String = ""
    
    let Questions : Array = ["What treatment have you had? ","Do you have any medical conditions? ","Any additional information? "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let layer1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 8))
        layer1.backgroundColor = UIColor(red:0.9, green:0.92, blue:0.94, alpha:1)
        self.view.addSubview(layer1)
        
        
        let layer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width*2/3, height: 8))
        layer.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*2/3 , height: 8)
        gradient.colors = [
            UIColor(red:1, green:1, blue:1, alpha:0.5).cgColor,
            UIColor(red:0.08, green:0.65, blue:1, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 0)
        layer.layer.addSublayer(gradient)
        
        self.view.addSubview(layer)
        
        let image : UIImage = UIImage.init(named: "DoctaLogo")!
        let imageview : UIImageView = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
        self.navigationController?.navigationBar.addSubview(imageview)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Step1ReasonsTVC.dismissKeyboard))
        
        
        self.view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        self.navigationItem.hidesBackButton = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.text = self.tableView(tableView, titleForHeaderInSection: section)
        header.textLabel?.font = UIFont(name: "Rubik", size: 16)
        header.textLabel?.textAlignment = NSTextAlignment.left
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 2
        {
            return 3
        }
        else {
            return 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "Cell0", for: indexPath) as! TitlesTableViewCell
            cell0.titleLabel1.text = "Step 3: "
            cell0.titleLabel2.text = "Treatment History"
            
            return cell0
        }
        
        if indexPath.section == 1 {
            let cell2  = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! LabelsTableViewCell
            cell2.label1.text = "Country:"
            cell2.label1detail.text = self.SelectedLocationText2
            cell2.label2.text = "Specialist"
            cell2.label2detail.text = self.SelectedSpecialities2
            return cell2
            
        }
        
        
        
        
        
        if indexPath.section == 3 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! ImageCollectionTableViewCell
          //  cell3.numberofRows = 3
            cell3.delegate = self
            
            
            
            
            return cell3
        }
        
        if indexPath.section == 4 {
            let footerCell = tableView.dequeueReusableCell(withIdentifier: "CellFooter", for: indexPath) as! NextBackButtonsTableViewCell
            footerCell.nextButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
            footerCell.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
            footerCell.infoButton.addTarget(self, action: #selector(InfoButton), for: .touchUpInside)
            
            
            return footerCell
        }
            
        else {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TextViewTableViewCell
            cell1.titleLabel.text = Questions[indexPath.row]
            
            
            switch indexPath.row {
            case 0:
                if ReviewCasefileManager.sharedInstance.Q4TreatmentHistory != "" {
                    cell1.textview.text = ReviewCasefileManager.sharedInstance.Q4TreatmentHistory
                    ReviewCasefileManager.sharedInstance.Q4TreatmentHistory = cell1.textview.text
                }
                else {
                    ReviewCasefileManager.sharedInstance.Q4TreatmentHistory = cell1.textview.text
                }
                
                
            case 1:
                if ReviewCasefileManager.sharedInstance.Q5MedicalConditions != "" {
                    cell1.textview.text = ReviewCasefileManager.sharedInstance.Q5MedicalConditions
                    ReviewCasefileManager.sharedInstance.Q5MedicalConditions = cell1.textview.text
                }
                else {
                    ReviewCasefileManager.sharedInstance.Q5MedicalConditions = cell1.textview.text
                }
                
                
                
            case 2:
                if ReviewCasefileManager.sharedInstance.Q6AddtionalInformation != "" {
                    cell1.textview.text = ReviewCasefileManager.sharedInstance.Q6AddtionalInformation
                    ReviewCasefileManager.sharedInstance.Q6AddtionalInformation = cell1.textview.text
                }
                else {
                    ReviewCasefileManager.sharedInstance.Q6AddtionalInformation = cell1.textview.text
                }
                
                
                
            default:
                break
            }
            
            
            return cell1
        }
        
    }
    
    func nextButton(){
        let cell1 = tableView.cellForRow(at: IndexPath.init(row: 0, section: 2)) as! TextViewTableViewCell
        ReviewCasefileManager.sharedInstance.Q4TreatmentHistory = cell1.textview.text
        let cell2 = tableView.cellForRow(at: IndexPath.init(row: 1, section: 2)) as! TextViewTableViewCell
        ReviewCasefileManager.sharedInstance.Q5MedicalConditions = cell2.textview.text
        let cell3 = tableView.cellForRow(at: IndexPath.init(row: 2, section: 2)) as! TextViewTableViewCell
        ReviewCasefileManager.sharedInstance.Q6AddtionalInformation = cell3.textview.text
        
        
        
        let storyboard1 = UIStoryboard(name: "ReviewCase", bundle: nil)
        let controller1 = storyboard1.instantiateViewController(withIdentifier: "ReviewCaseVC")
        self.navigationController?.pushViewController(controller1, animated: false)
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AuthVCNAv")
        self.present(controller, animated: false, completion: nil)

    }
    func backButton(){
        self.navigationController?.popViewController(animated: true)
        
        
    }
    func InfoButton(){
        let introVC = Step2IntroViewController(nibName: "Step1IntroductionViewController", bundle: nil)
        self.present(introVC, animated: true, completion: nil)
        
    }
    
    
    func loadNewScreen(controller: UIViewController) {
        self.present(controller, animated: true) { () -> Void in
            
        };
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        if section == 3 {
            return "Add Reports or referral "
        }
        else {
            return nil
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        if section == 3 {
            return 35
        }
        else {
            return 0
        }
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        //  view.endEditing(true)
        view.endEditing(true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 20
        }
        if indexPath.section == 2 {
            return 100
        }
        
        if indexPath.section == 3 {
            return 100
        }
        
        
        
        if indexPath.section == 4 {
            return 70
        }
            
            
        else {
            
            return 30
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
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
