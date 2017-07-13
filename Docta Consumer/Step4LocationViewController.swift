//
//  Step4LocationViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 12/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import DropDown

class Step4LocationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!

    
    let locationDropdown = DropDown()
    let locationsnames = ["North","West","South","East","Centre"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTextField.delegate = self
        button1.addTarget(self, action: #selector(changebuttonstates), for: UIControlEvents.touchUpInside)
        button2.addTarget(self, action: #selector(changebuttonstates), for: UIControlEvents.touchUpInside)
        button3.addTarget(self, action: #selector(changebuttonstates), for: UIControlEvents.touchUpInside)
        
        

        // Do any additional setup after loading the view.
    }
    
    func setupDropdown () {
        locationDropdown.anchorView = locationTextField
        locationDropdown.dataSource = locationsnames
        locationDropdown.direction = .any
        
        
        locationDropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.locationTextField.text = item
            print("Selected Specialist is \(item) at index \(index)")
            
        }
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        locationDropdown.show()
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        locationDropdown.hide()
        return false
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func changebuttonstates () {
        
        if button1.isTouchInside {
            button1.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            button2.backgroundColor = UIColor.groupTableViewBackground
            button3.backgroundColor = UIColor.groupTableViewBackground
            print("button 1 is selected")
            locationLabel.text = button1.titleLabel?.text
            
        }
        if button2.isTouchInside {
            button2.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            button1.backgroundColor = UIColor.groupTableViewBackground
            button3.backgroundColor = UIColor.groupTableViewBackground
            locationLabel.text = button2.titleLabel?.text
            print("button 2 is selected")
        }
        if button3.isTouchInside {
            button3.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            button1.backgroundColor = UIColor.groupTableViewBackground
            button2.backgroundColor = UIColor.groupTableViewBackground
            locationLabel.text = button3.titleLabel?.text
            print("button 3 is selected")
        }
        
        
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupDropdown()
    }
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
     //   self.present(controller, animated: true, completion: nil)
        
        
        
        
        //             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Auth" bundle:nil];
        //             Step1YourcaseViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SignupVC"];
        //             [[self navigationController] pushViewController:vc animated:YES];
        
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
