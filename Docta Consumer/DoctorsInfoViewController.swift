//
//  DoctorsInfoViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 23/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD

class DoctorsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    public var SpecialistID : String = ""
    var responseObject : NSDictionary = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SVProgressHUD.show()
        TableView.isHidden = true
        TableView.dataSource = self
        TableView.delegate = self
        TableView.estimatedRowHeight = 100
        TableView.rowHeight = UITableViewAutomaticDimension
        TableView.setNeedsLayout()
        TableView.layoutIfNeeded()
        
        let button = UIButton.init(type: .custom)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik", size: 15)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 35)
        button.addTarget(self, action: #selector(SignupButton), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
        // Do any additional setup after loading the view.
    }
    
    func SignupButton() {
        
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.SpecialistID = ReviewCasefileManager.sharedInstance.SelectedSpecialistID
        let APIsession : APIHandler = APIHandler()
        print("Doctor ID is \(SpecialistID)")
        TableView.tableFooterView = UIView()
        TableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0.01))
        
        
        APIsession.getDatafromAPI("GET", "specialist/\(SpecialistID)", nil) { (response, error) in
            if (response != nil) {
                print(response as Any)
                let json : NSDictionary = response as! NSDictionary
                self.responseObject = json.value(forKey: "data") as! NSDictionary
                SVProgressHUD.dismiss()
                self.TableView.isHidden = false
                self.TableView.reloadData()
                
            }
            if (error != nil) {
                SVProgressHUD.dismiss()
                print("Error is \(String(describing: error))")
                
            }
        }
        
        SVProgressHUD.dismiss()
        

        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        else {
            return UITableViewAutomaticDimension
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 3
        }
        if section == 2 {
            return 2
        }
        
        else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
            if indexPath.section == 0 {
                        let cell0 = TableView.dequeueReusableCell(withIdentifier: "IntroCell", for: indexPath) as! DoctorsIntroTableViewCell
                    if responseObject.allKeys.count > 0
                    {
                        
                            let firstname : String = responseObject.value(forKeyPath: "name.first") as! String
                            let lastname : String = responseObject.value(forKeyPath: "name.last") as! String
                            let doctorName : String = "Dr. " + firstname + " " + lastname
                
                            cell0.titleLabelDoctor.text = doctorName
                            cell0.detailLabelCity.text = (responseObject.value(forKey: "city") as? String)
                            cell0.imageviewdoctor.image = UIImage.init(named: "doctordummyprofile")
                            let APIimage:String = responseObject.value(forKey: "image") as! String
                            let imagestring : String = "https://account.docta.com" + APIimage
                            cell0.imageviewdoctor.sd_setImage(with: URL(string: imagestring), placeholderImage: UIImage(named: "doctordummyprofile"))
                        
                        
                    }
                return cell0
            }
            
                if indexPath.section == 1
                {
                            let cell1 = TableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
                            if responseObject.allKeys.count > 0
                        {
                            if indexPath.row == 0 {
                                let phone : String = responseObject.value(forKeyPath: "phone") as! String
                                
                                cell1.textLabel?.text = "Phone: " + phone
                                
                                
                            }
                            
                            if indexPath.row == 1 {
                                let email : String = responseObject.value(forKey: "email") as! String
                                cell1.textLabel?.text = "Email: " + email
                            }
                            
                            if indexPath.row == 2 {
                                let address: String = responseObject.value(forKey: "address") as! String
                                cell1.textLabel?.text = "Address: " + address
                                
                            }
                            
                            
                            
                    }
                return cell1
                }
                if indexPath.section == 2 {
                    
                        let cell2 = TableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
                        if responseObject.allKeys.count > 0
                        {
                            
                            if indexPath.row == 0 {
                                let qualifications : String = responseObject.value(forKey: "qualifications") as! String
                                cell2.textLabel?.text = "Qualification: " + qualifications
                                
                            }
                            
                            if indexPath.row == 1 {
                                cell2.textLabel?.text = "Memberships: " + (responseObject.value(forKey: "memberships") as? String)!
                            }
                    
                    }
                    
                    return cell2
                        
                    
                }
                    

                
            else {
                    let cell3 = TableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
                            if responseObject.allKeys.count > 0
                            {
                        
                       
                            if indexPath.row == 0 {
                                cell3.textLabel?.text = "Awards: " + (responseObject.value(forKey: "awards") as? String)!
                                
                                
                            }
                            
                            if indexPath.row == 1 {
                                cell3.textLabel?.text = "Publications: " + (responseObject.value(forKey: "publications") as? String)!
                            }
                        }

                    return cell3
            }
            
                
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func BackButtononTop() {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Contact Info"
        }
        if section == 2 {
            return "Qualifications/Memberships"
        }
        if section == 3 {
            return "Awards/Publications"
        }
        else{
        return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 35
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.text = self.tableView(tableView, titleForHeaderInSection: section)
        header.textLabel?.font = UIFont(name: "Rubik", size: 15)
        header.textLabel?.textAlignment = NSTextAlignment.left
        
        
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
