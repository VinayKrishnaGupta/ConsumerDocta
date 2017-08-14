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
   
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupDropDowns()
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
