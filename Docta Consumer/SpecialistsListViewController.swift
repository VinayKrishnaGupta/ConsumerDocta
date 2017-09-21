//
//  SpecialistsListViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

class SpecialistsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableView: UITableView!
    public var DoctorslistFiltered = Array<NSDictionary>()
    @IBOutlet weak var specialityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        SVProgressHUD.dismiss(withDelay: 2)
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

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return DoctorslistFiltered.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DoctorsIntroTableViewCell
        let dict : NSDictionary = DoctorslistFiltered[indexPath.section]
        if(dict.allKeys.count > 0) {
            let APIimage:String = dict.value(forKey: "image") as! String
            let imagestring : String = "https://account.docta.com" + APIimage
            cell.imageviewdoctor.sd_setImage(with: URL(string: imagestring), placeholderImage: UIImage(named: "doctordummyprofile"))
            
            let firstname : String = dict.value(forKeyPath: "name.first") as! String
            let lastname : String = dict.value(forKeyPath: "name.last") as! String
            
            let doctorName : String = "Dr." + firstname + lastname
            cell.titleLabelDoctor.text = doctorName
            let cityName : String = dict.value(forKey: "city") as! String
            cell.detailLabelCity.text = cityName
        }
        
       
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        cell.selectedBackgroundView = blurEffectView

        
        
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        cell?.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.groupTableViewBackground
        cell?.backgroundColor = UIColor.groupTableViewBackground
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDoctor : NSDictionary = DoctorslistFiltered[indexPath.section]
        ReviewCasefileManager.sharedInstance.SelectedSpecialistID = selectedDoctor.value(forKey: "_id") as! String
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
               
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        
                let storyboard = UIStoryboard(name: "CreateNewCase", bundle: nil)
                let controller :Step1ReasonsTVC  = storyboard.instantiateViewController(withIdentifier: "Step1VC") as! Step1ReasonsTVC
                controller.SelectedLocationText = ReviewCasefileManager.sharedInstance.CountryName
                controller.SelectedSpecialities = ReviewCasefileManager.sharedInstance.SpecialistyName
                self.navigationController?.pushViewController(controller, animated: true)
                

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        specialityNameLabel.text = ReviewCasefileManager.sharedInstance.SpecialistyName
        countryNameLabel.text = ReviewCasefileManager.sharedInstance.CountryName
        
        
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
