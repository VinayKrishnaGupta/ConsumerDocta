//
//  Step1ReasonsTVC.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class Step1ReasonsTVC: UIViewController, UITableViewDataSource, UITableViewDelegate,OpenCameraProtocol {
    @IBOutlet weak var tableView: UITableView!
    let Questions : Array = ["Why do you need a specialist?","How did this problem start?","What are the symptoms?"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let image : UIImage = UIImage.init(named: "DoctaLogo")!
        let imageview : UIImageView = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
        self.navigationController?.navigationBar.addSubview(imageview)
        self.navigationItem.hidesBackButton = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Step1ReasonsTVC.dismissKeyboard))
        
        
        self.view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false
        
        let layer1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 8))
        layer1.backgroundColor = UIColor(red:0.9, green:0.92, blue:0.94, alpha:1)
        self.view.addSubview(layer1)
        
        
        let layer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/3, height: 8))
        layer.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/3 , height: 8)
        gradient.colors = [
            UIColor(red:1, green:1, blue:1, alpha:0.5).cgColor,
            UIColor(red:0.08, green:0.65, blue:1, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 0)
        layer.layer.addSublayer(gradient)
        
        self.view.addSubview(layer)
        
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
        return 6
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 3
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
            cell3.delegate = self
            
            
            
            
            return cell3
        }
        
        if indexPath.section == 5 {
            let footerCell = tableView.dequeueReusableCell(withIdentifier: "CellFooter", for: indexPath) as! NextBackButtonsTableViewCell
            footerCell.nextButton.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
            footerCell.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
            footerCell.infoButton.addTarget(self, action: #selector(InfoButton), for: .touchUpInside)
            
            
            return footerCell
        }
        
        else {
           let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TextViewTableViewCell
            cell1.titleLabel.text = Questions[indexPath.row]
            cell1.textview.text = ""
            
            
            return cell1
        }
        
        
    
        
        
        
        
        
    }
    
    func nextButton(){
        print("Button tapped")
        self.performSegue(withIdentifier: "step2symptoms", sender: nil)
        
    }
    func backButton(){
        self.navigationController?.dismiss(animated: true, completion: nil)
        
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
            return 35
        }
        if section == 4 {
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
        if indexPath.section == 3 {
            return 100
        }
            
        if indexPath.section == 2 {
            return 60
        }
        
        if indexPath.section == 4 {
            return 100
        }
        if indexPath.section == 5 {
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
