//
//  Step3TreatmentHistoryViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import FileBrowser

class Step3TreatmentHistoryViewController: UIViewController {
    @IBOutlet weak var treatmenttextView: UITextView!
    let fileBrowser = FileBrowser()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        let myColor = UIColor.darkText
        treatmenttextView.layer.borderWidth = 1
        treatmenttextView.layer.cornerRadius = 10
        treatmenttextView.layer.borderColor = myColor.cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentsURL = paths[0] as NSURL

        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
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
