//
//  Step2SymptomsViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import ImagePicker
import Lightbox
import SDWebImage


class Step2SymptomsViewController: UIViewController, ImagePickerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
   // @IBOutlet weak var uploadimagesbutton: UIButton!
    let imagepicker = ImagePickerController()
    var imagearray  = [UIImage]()
    

    @IBOutlet weak var symptomstextfield: UITextField!
    @IBOutlet weak var collectionViewImages: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewImages.dataSource = self
        collectionViewImages.delegate = self
        imagepicker.delegate = self
        self.navigationItem.hidesBackButton = true
        symptomstextfield.delegate = self
        collectionViewImages.tag = 111
        
        
        let layer1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 8))
        layer1.backgroundColor = UIColor(red:0.9, green:0.92, blue:0.94, alpha:1)
        self.view.addSubview(layer1)
        
        
        let layer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/4, height: 8))
        layer.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/4 , height: 8)
        gradient.colors = [
            UIColor(red:1, green:1, blue:1, alpha:0.5).cgColor,
            UIColor(red:0.08, green:0.65, blue:1, alpha:1).cgColor
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 0)
        layer.layer.addSublayer(gradient)
        
        self.view.addSubview(layer)
//        NotificationCenter.default.addObserver(self, selector: #selector(Step2SymptomsViewController.keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(Step2SymptomsViewController.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        
       
        
        let tap: UIGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(Step2SymptomsViewController.dismissKeyboard))
        tap.delegate = self
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
        
       
  
    }

    
   

    
    
    func keyboardWillShow(notification: NSNotification) {
        
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
            // if using constraints
            // bottomViewBottomSpaceConstraint.constant = keyboardSize.height
            self.view.frame.origin.y -= keyboardSize.height/2
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectImagefromGalleryandCamera() {
        var config = Configuration()
        config.doneButtonTitle = "Finish"
        config.noImagesTitle = "Sorry! There are no images here!"
        config.recordLocation = false
        //  config.allowVideoSelection = false
        
        
        imagepicker.configuration = config
        imagepicker.delegate = self
        
        present(imagepicker, animated: true, completion: nil)

        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.symptomstextfield.resignFirstResponder()
        return true
    }
    
    
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
        imagearray = images
        collectionViewImages.reloadData()
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagearray.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell   = collectionViewImages.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BodyPartImagesCollectionViewCell
        
        if indexPath.row == 0 {
           // cell.cellImageView.image = UIImage.init(named: "folderplus")
        cell.cellImageView.image = UIImage.sd_animatedGIFNamed("plusgif")
        }
        else {
            cell.cellImageView.image = imagearray[indexPath.row-1]
            
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.selectImagefromGalleryandCamera()
        }
        
        else {
            
            
        }
        
        
        
        
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow , object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide , object: self.view.window)
    }

    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
      //  view.endEditing(true)
        view.endEditing(true)
        
    }
 
    
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "step3treatmenthistory", sender: self)
        
    }
   
    @IBAction func backButton(_ sender: UIButton) {
      self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func introButton(_ sender: UIButton) {
        
        let introVC = Step2IntroViewController(nibName: "Step2IntroViewController", bundle: nil)
        self.present(introVC, animated: true, completion: nil)
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        symptomstextfield.resignFirstResponder()
        
        return true
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
