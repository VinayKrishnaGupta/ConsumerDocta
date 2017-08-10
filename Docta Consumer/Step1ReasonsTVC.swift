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
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1
        {
            return 3
        }
        else {
            return 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell2  = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! LabelsTableViewCell
            cell2.label1.text = "Your injury"
            cell2.label1detail.text = "Label 2"
            cell2.label2.text = "Label3"
            cell2.label2detail.text = "Label4"
            
            
            return cell2
        }
       
        if indexPath.section == 2 {
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! collectionTableViewCell
            
            return cell3
        }
            
        
        else {
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TextViewTableViewCell
            cell1.titleLabel.text = "Title is here"
            cell1.textview.text = "No Text"
            
            
            return cell1
        }
        
        
    
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Title 1"
        }
        
        else {
            return "Title 2"
        }
        
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        //  view.endEditing(true)
        view.endEditing(true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        }
        if indexPath.section < 4{
            return 100
        }
        
        else {
            
            return 50
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
