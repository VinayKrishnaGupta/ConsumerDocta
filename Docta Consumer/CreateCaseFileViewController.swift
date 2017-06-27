//
//  CreateCaseFileViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 13/06/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import DropDown
import ImagePicker
import Lightbox
import Alamofire 



class CreateCaseFileViewController: UIViewController, UITextFieldDelegate, ImagePickerDelegate {

    @IBOutlet weak var SpecialistTextField: UITextField!
    @IBOutlet weak var ProceduresTextField: UITextField!
    let specialistDropdown = DropDown()
    let proceduresDropdown = DropDown()
    let Specilistlist = ["Dentist", "Orthopedic", "Neurologist", "Radiologist"]
    let ProcedureList = ["Pain", "Bonding", "Headache"]
    let imagePickerController = ImagePickerController()
    let imagePicker = ImagePickerController()
  //  lazy var button: UIButton = self.makeButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        SpecialistTextField.delegate = self
        ProceduresTextField.delegate = self
        imagePicker.delegate = self
        imagePickerController.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateCaseFileViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        
        
//        view.backgroundColor = UIColor.white
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addConstraint(
//            NSLayoutConstraint(item: button, attribute: .centerX,
//                               relatedBy: .equal, toItem: view,
//                               attribute: .centerX, multiplier: 1,
//                               constant: 0))
//        
//        view.addConstraint(
//            NSLayoutConstraint(item: button, attribute: .centerY,
//                               relatedBy: .equal, toItem: view,
//                               attribute: .centerY, multiplier: 1,
//                               constant: 0))
//        
        // Do any additional setup after loading the view.
    }
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func CreateCaseButton(_ sender: UIButton) {
        
        let parameters2 = ["speciality_id":"application/json", "first_name":"Donald", "last_name": "Duck"]
        
        let HEADERS: HTTPHeaders = [
            "Content-Type": "application/json",
            
        ]
        
        
        Alamofire.request( URL(string:"https://private-61dbf0-doctaapi.apiary-mock.com/api/casefile")!, method: .post, parameters: parameters2, headers: HEADERS )
            
            
            .responseJSON { response in
                debugPrint(response)
                
             
                if let json = response.result.value {
                    print(json)
                    let dict = json as! NSDictionary
                    let casefilenumber : String = dict.value(forKey: "id") as! String
                    let alert = UIAlertController(title: "Your Casefile is Successfully Created", message: "Case file Number : \(casefilenumber)", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                   // alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
                    let button2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: self.cancel)
                    alert.addAction(button2)
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)

                    
                    
                    }
                
        }
        
        
        
  
        
        
    }
    


func cancel(action:UIAlertAction) {
    self.navigationController?.popViewController(animated: true)
    
}



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setupDropDowns()
    }
    
    
    func setupDropDowns() {
        specialistDropdown.anchorView = SpecialistTextField
        specialistDropdown.dataSource = Specilistlist
        specialistDropdown.direction = .any
        
        specialistDropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.SpecialistTextField.text = item
            print("Selected Specialist is \(item) at index \(index)")
           
        }
        
        
        proceduresDropdown.anchorView = ProceduresTextField
        proceduresDropdown.dataSource = ProcedureList
       
        proceduresDropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.ProceduresTextField.text = item
            print("Selected Procedure is \(item) at index \(index)")
            
            
        }

        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == SpecialistTextField {
            specialistDropdown.show()
            proceduresDropdown.hide()
            
            return false
        }
        
        if textField == ProceduresTextField {
            specialistDropdown.hide()
            proceduresDropdown.show()
            return false
            
        }
        
        else {
            return true
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == SpecialistTextField {
            specialistDropdown.hide()
            proceduresDropdown.hide()
            
            return false
        }
        
        if textField == ProceduresTextField {
            specialistDropdown.hide()
            proceduresDropdown.hide()
            return false
            
        }
            
        else {
            return true
        }

    }

    @IBAction func SelectImage(_ sender: UIButton) {
        
        var config = Configuration()
        config.doneButtonTitle = "Finish"
        config.noImagesTitle = "Sorry! There are no images here!"
        config.recordLocation = false
        //  config.allowVideoSelection = false
        
        
        imagePicker.configuration = config
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
//    func makeButton() -> UIButton {
//        let button = UIButton()
//        button.setTitle("Show ImagePicker", for: .normal)
//        button.setTitleColor(UIColor.black, for: .normal)
//        button.addTarget(self, action: #selector(buttonTouched(button:)), for: .touchUpInside)
//        
//        return button
//    }
//    
//    func buttonTouched(button: UIButton) {
//        var config = Configuration()
//        config.doneButtonTitle = "Finish"
//        config.noImagesTitle = "Sorry! There are no images here!"
//        config.recordLocation = false
//      //  config.allowVideoSelection = false
//        
//        
//        imagePicker.configuration = config
//        imagePicker.delegate = self
//        
//        present(imagePicker, animated: true, completion: nil)
//    }
    
    // MARK: - ImagePickerDelegate
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
        let lightboxImages = images.map {
            return LightboxImage(image: $0)
        }
        
        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true, completion: nil)
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
