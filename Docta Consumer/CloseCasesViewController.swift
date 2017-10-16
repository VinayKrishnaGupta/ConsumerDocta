    //
//  CloseCasesViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 02/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD

class CloseCasesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    public var ClosedCaseList = Array<NSDictionary>()
    let codedLabel:UILabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let image : UIImage = UIImage.init(named: "DoctaLogo")!
        let imageview : UIImageView = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
        self.navigationController?.navigationBar.addSubview(imageview)
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ClosedCaseList.count
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let dict : NSDictionary = ClosedCaseList[indexPath.section]
        let Specialistity : String = dict.value(forKeyPath: "speciality.name") as! String
        let doctortitle : String = dict.value(forKeyPath: "specialist.title") as! String
        let doctorfirstname : String = dict.value(forKeyPath: "specialist.name.first") as! String
        let doctorLastname : String = dict.value(forKeyPath: "specialist.name.last") as! String
        
        
        let specialistName: String = doctortitle + " " + doctorfirstname + " " + doctorLastname
        
        
        cell.textLabel?.text = specialistName
        cell.detailTextLabel?.text = Specialistity
       
        
        
        
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func ReloadData() {
        print("Close Case file in VC is \(ClosedCaseList)")
        
        if ClosedCaseList.count < 1 {
            self.tableView.isHidden = true
            self.codedLabel.isHidden = false
            self.codedLabel.frame = CGRect(x: 100, y: 100, width: self.view.frame.height/2, height: self.view.frame.height/2)
            self.codedLabel.textAlignment = .center
            self.codedLabel.text = "You don't have any Closed casefile yet."
            self.codedLabel.numberOfLines=2
            self.codedLabel.layer.cornerRadius = 20
            self.codedLabel.textColor=UIColor.white
            self.codedLabel.font=UIFont.systemFont(ofSize: 18)
            //  self.codedLabel.backgroundColor=UIColor(red:0.08, green:0.65, blue:1, alpha:1)
            self.view.addSubview(self.codedLabel)
            self.codedLabel.translatesAutoresizingMaskIntoConstraints = false
            self.codedLabel.heightAnchor.constraint(equalToConstant: self.view.frame.height/2).isActive = true
            self.codedLabel.widthAnchor.constraint(equalToConstant: self.view.frame.height/2).isActive = true
            self.codedLabel.centerXAnchor.constraint(equalTo: self.codedLabel.superview!.centerXAnchor).isActive = true
            self.codedLabel.centerYAnchor.constraint(equalTo: self.codedLabel.superview!.centerYAnchor).isActive = true
            SVProgressHUD.dismiss()
            
        }
        else {
            self.codedLabel.isHidden = true
            self.tableView.isHidden = false
            self.tableView.reloadData()
            
        }
        
        SVProgressHUD.dismiss()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReviewCasefileManager.sharedInstance.CasefileSelected = ClosedCaseList[indexPath.section]
        self.performSegue(withIdentifier: "casedetailfromclosed", sender: nil)
        
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
