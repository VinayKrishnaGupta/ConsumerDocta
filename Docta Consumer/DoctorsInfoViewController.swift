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
    override func viewDidLoad() {
        super.viewDidLoad()
        let APIsession : APIHandler = APIHandler()
        print("Doctor ID is \(SpecialistID)")
        
        APIsession.getDatafromAPI("GET", "options", nil) { (response, error) in
            if (response != nil) {
                print(response)
                let json : NSDictionary = response as! NSDictionary
                
               
               
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
