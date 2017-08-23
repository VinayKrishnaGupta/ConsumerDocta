//
//  DoctorsInfoViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 23/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class DoctorsInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    public var SpecialistID : String = ""
    var responseObject : NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.estimatedRowHeight = 50
        
        
        let APIsession : APIHandler = APIHandler()
        print("Doctor ID is \(SpecialistID)")
        
        APIsession.getDatafromAPI("GET", "specialist/\(SpecialistID)", nil) { (response, error) in
            if (response != nil) {
                print(response as Any)
                let json : NSDictionary = response as! NSDictionary
                self.responseObject = json.value(forKey: "data") as! NSDictionary
               self.TableView.reloadData()
               
            }
            if (error != nil) {
                print("Error is \(String(describing: error))")
               
            }
        }

        
        

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        if responseObject.allKeys.count > 0 {
            if indexPath.row == 0 {
                let firstname : String = responseObject.value(forKeyPath: "name.first") as! String
                let lastname : String = responseObject.value(forKeyPath: "name.last") as! String
                
                let doctorName : String = "Dr. " + firstname + " " + lastname
                cell.textLabel?.text = "Name: " + doctorName
                
            }
            
            if indexPath.row == 1 {
                let address: String = responseObject.value(forKey: "address") as! String
                cell.textLabel?.text = "Address: " + address
            }
            
            if indexPath.row == 2 {
                let email : String = responseObject.value(forKey: "email") as! String
                cell.textLabel?.text = "Email: " + email
            }
            if indexPath.row == 3 {
                let qualifications : String = responseObject.value(forKey: "qualifications") as! String
                cell.textLabel?.text = "Qualification: " + qualifications
                
            }

        }
        
        
        
        return cell
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
