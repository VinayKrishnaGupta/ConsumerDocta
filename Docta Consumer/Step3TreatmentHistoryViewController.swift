//
//  Step3TreatmentHistoryViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import FileBrowser

class Step3TreatmentHistoryViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var treatmenttextView: UITextView!
    let fileBrowser = FileBrowser()

    @IBOutlet weak var additionalTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       // additionalTextView.delegate = self
        treatmenttextView.delegate = self
        additionalTextField.delegate = self as? UITextFieldDelegate
        
        
        self.navigationItem.hidesBackButton = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        let myColor = UIColor.darkText
        treatmenttextView.layer.borderWidth = 1
        treatmenttextView.layer.cornerRadius = 10
        treatmenttextView.layer.borderColor = myColor.cgColor
        
//        NotificationCenter.default.addObserver(self, selector: #selector(Step3TreatmentHistoryViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(Step3TreatmentHistoryViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(Step3TreatmentHistoryViewController.keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Step3TreatmentHistoryViewController.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentsURL = paths[0] as NSURL

        // Do any additional setup after loading the view.
    }
    
   
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
                // if using constraints
                // bottomViewBottomSpaceConstraint.constant = keyboardSize.height
                self.view.frame.origin.y -= keyboardSize.height
                UIView.animate(withDuration: duration) {
                    self.view.layoutIfNeeded()
                }
            }
        
        
        
        
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
    }
    
    
    
    
    func keyboardWillHide(notification: NSNotification) {
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        //if using constraint
        //       bottomViewBottomSpaceConstraint.constant = 0
        self.view.frame.origin.y = (self.navigationController?.navigationBar.frame.height)!

        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
        
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
//    }
    
   
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        self.resignFirstResponder()
        view.endEditing(true)
        
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow , object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide , object: self.view.window)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadFileButton(_ sender: UIButton) {
        
        present(fileBrowser, animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "step4Location", sender: sender)
        
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
        
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButton(_ sender: UIButton) {
     self.navigationController?.popViewController(animated: true)
        
        
        
    }

}
