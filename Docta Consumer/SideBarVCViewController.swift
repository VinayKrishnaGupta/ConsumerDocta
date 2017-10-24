//
//  SideBarVCViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 20/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD

class SideBarVCViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableView: UITableView!
    let MenuItems = ["Home","About Us","My Cases", "Contact Us","For Specialists","Sign Out"]
    override func viewDidLoad() {
        super.viewDidLoad()
    TableView.dataSource = self
    TableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuItems.count
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        cell.textLabel?.text = MenuItems[indexPath.section]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 5 {
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            
            SVProgressHUD.showSuccess(withStatus: "You have been successfully signed out")
            SVProgressHUD.dismiss(withDelay: 2)
        }
            
        if indexPath.section == 1 {
            self.performSegue(withIdentifier: "aboutus", sender: nil)
            
        }
        if indexPath.section == 3 {
            self.performSegue(withIdentifier: "contactus", sender: nil)
            
        }
        else {
            SVProgressHUD.show(withStatus: "Coming Soon...")
            SVProgressHUD.dismiss(withDelay: 2)
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
