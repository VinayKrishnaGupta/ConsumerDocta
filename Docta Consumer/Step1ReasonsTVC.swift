//
//  Step1ReasonsTVC.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class Step1ReasonsTVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let Questions : Array = ["Why do you need a spcialist","How did this problem start","What are the symptoms?"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Step1ReasonsTVC.dismissKeyboard))
        
        
        self.view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 3
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
            cell0.titleLabel1.text = "Step 2: "
            cell0.titleLabel2.text = "Reason"
            
            return cell0
        }
        
        if indexPath.section == 1 {
            let cell2  = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! LabelsTableViewCell
            cell2.label1.text = "Your injury"
            cell2.label1detail.text = "Back Pain"
            cell2.label2.text = "Specialist"
            cell2.label2detail.text = "Orthopedics"
            return cell2
            
        }
        
        
        if indexPath.section == 2 {
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! collectionTableViewCell
            cell4.numberofRows = 4
            cell4.listofValues = ["DAYS","WEEKS","MONTHS","YEARS"]

            return cell4
            
        }
       
        
            
        if indexPath.section == 4 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! ImageCollectionTableViewCell
            cell3.numberofRows = 3
            
            
            return cell3
        }
            
        
        else {
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TextViewTableViewCell
            cell1.titleLabel.text = Questions[indexPath.row]
            cell1.textview.text = ""
            
            
            return cell1
        }
        
        
    
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 2 {
            return "How long have you had this problem?"
        }
        
        if section == 4 {
            return "Add any image or video that might help"
        }
        else {
            return nil
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 30
        }
        if section == 4 {
            return 20
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
        if indexPath.section == 3 {
            return 100
        }
            
        if indexPath.section == 2 {
            return 60
        }
        
        if indexPath.section == 4 {
            return 100
        }
            
        
        else {
            
            return 30
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
