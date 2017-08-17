//
//  HomeTab1ViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 27/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import DropDown


class HomeTab1ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var clinicNametextfield: UITextField!

    @IBOutlet weak var locationTextField: UITextField!
    let specialistDropdown = DropDown()
     let Specilistlist = ["Dentist", "Orthopedic", "Neurologist", "Radiologist"]
    let locationdropdown = DropDown()
    let LocationsList = ["Australia","India", "Singapore", "China","Indonesia","Taiwan", "Japan", "United Kingdom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image : UIImage = UIImage.init(named: "DoctaLogo")!
        let imageview : UIImageView = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
        self.navigationController?.navigationBar.addSubview(imageview)
        
    clinicNametextfield.delegate = self
    locationTextField.delegate = self
        
        clinicNametextfield.rightViewMode = .always
        let rightView = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        
        let imageName = "downarrow.png"
        let image2 = UIImage(named: imageName)
        let imageView = UIImageView(image: image2!)
        imageView.frame = CGRect(x: 0, y: 5, width: 15, height: 15)
        rightView.addSubview(imageView)
        
        clinicNametextfield.rightView = rightView
        
        
        let rightView3 = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        
        let imageName3 = "downarrow.png"
        let image3 = UIImage(named: imageName3)
        let imageView3 = UIImageView(image: image3!)
        imageView3.frame = CGRect(x: 0, y: 5, width: 15, height: 15)
        rightView3.addSubview(imageView3)
        locationTextField.rightViewMode = .always
        locationTextField.rightView = rightView3
     
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupDropDowns()
        
//        let APIsession : APIHandler = APIHandler()
//        
//        APIsession.getDatafromAPI("GET", "/options", nil, completionBlock:nil)
        
        
    }
    
    func SignupButton() {
        
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
        
    }
    
    func setupDropDowns() {
        specialistDropdown.anchorView = clinicNametextfield
        specialistDropdown.dataSource = Specilistlist
        specialistDropdown.direction = .any
        specialistDropdown.textColor = UIColor.white
        specialistDropdown.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 166/255, blue: 255/255, alpha: 1)
        specialistDropdown.selectionBackgroundColor = UIColor.lightGray
        specialistDropdown.cellHeight = 35
        
        
        specialistDropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.clinicNametextfield.text = item
            print("Selected Specialist is \(item) at index \(index)")
            
        }
        
        
        locationdropdown.anchorView = locationTextField
        locationdropdown.dataSource = LocationsList
        locationdropdown.direction = .any
        locationdropdown.textColor = UIColor.white
        locationdropdown.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 166/255, blue: 255/255, alpha: 1)
        locationdropdown.selectionBackgroundColor = UIColor.lightGray
        locationdropdown.cellHeight = 35
        
        locationdropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.locationTextField.text = item
            print("Selected Procedure is \(item) at index \(index)")
            
            
        }
        
        
    }
    
    
   
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == clinicNametextfield {
            specialistDropdown.show()
            locationdropdown.hide()
            
            return false
        }
        
        if textField == locationTextField {
            specialistDropdown.hide()
            locationdropdown.show()
            return false
            
        }
            
        else {
            return true
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == clinicNametextfield {
            specialistDropdown.hide()
            locationdropdown.hide()
            
            return false
        }
        
        if textField == clinicNametextfield {
            specialistDropdown.hide()
            locationdropdown.hide()
            return false
            
        }
            
        else {
            return true
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ProceedButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "CreateNewCase", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Step1VC")
      //  self.present(controller, animated: true, completion: nil)
      //  self.navigationController?.present(controller, animated: true, completion: nil)
        self.navigationController?.pushViewController(controller, animated: true)
        
        
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
