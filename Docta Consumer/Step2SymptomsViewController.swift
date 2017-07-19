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


class Step2SymptomsViewController: UIViewController, ImagePickerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
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
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Step2SymptomsViewController.dismissKeyboard))
//        
//        view.addGestureRecognizer(tap)
       
        
    //    uploadimagesbutton.addTarget(self, action: #selector(selectImagefromGalleryandCamera), for: UIControlEvents.touchUpInside)

        // Do any additional setup after loading the view.
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
        cell.cellImageView.image = UIImage.sd_animatedGIFNamed("addimagegif")
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

}
