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
    var Specilistlist = Array<NSDictionary>()
    var SpcialistiesNames = Array<String>()
    let locationdropdown = DropDown()
    var LocationsList = Array<String>()
    var responseObject : NSDictionary = [:]
    var selectedLocation : String = ""
    var SelectedSpecialities : String = ""
    
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
        
        
        let APIsession : APIHandler = APIHandler()
        APIsession.getDatafromAPI("POST", "options", nil) { (response, error) in
            if (response != nil) {
                print(response)
                let json : NSDictionary = response as! NSDictionary
                
                self.responseObject = json.value(forKey: "data") as! NSDictionary
                self.Specilistlist = self.responseObject.value(forKey: "specialities") as! Array
                self.SpcialistiesNames = self.responseObject.value(forKeyPath: "specialities.name") as! Array<String>
                self.LocationsList = self.responseObject.value(forKeyPath: "countries") as! Array<String>
                self.setupDropDowns()
            }
            if (error != nil) {
                print("Error is \(String(describing: error))")
            }
        }
        
    }
    
    func SignupButton() {
        
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
        
    }
    
    func setupDropDowns() {
        specialistDropdown.anchorView = clinicNametextfield
        
        
        specialistDropdown.dataSource = SpcialistiesNames
        specialistDropdown.direction = .any
        specialistDropdown.textColor = UIColor.white
        specialistDropdown.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 166/255, blue: 255/255, alpha: 1)
        specialistDropdown.selectionBackgroundColor = UIColor.lightGray
        specialistDropdown.cellHeight = 35
        
        
        specialistDropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.clinicNametextfield.text = item
            self.SelectedSpecialities = item
            print("Selected Specialist is \(self.SelectedSpecialities) at index \(index)")
            
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
            self.selectedLocation = item
            print("Selected Procedure is \(self.selectedLocation) at index \(index)")
            
            
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
        let controller :Step1ReasonsTVC  = storyboard.instantiateViewController(withIdentifier: "Step1VC") as! Step1ReasonsTVC
        controller.SelectedLocationText = selectedLocation
        controller.SelectedSpecialities = SelectedSpecialities
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
