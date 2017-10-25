//
//  HomeTab1ViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 27/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import DropDown
import SDWebImage
import SVProgressHUD
import SideMenuController


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
    var SelectedSpecialtyDict : NSDictionary = [:]
    var SpecialistListFromServer = Array<NSDictionary>()
    var SelectedDoctor : NSDictionary = [:]
    var cellselection : Bool = false
    var cellselectedindex : IndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        let image : UIImage = UIImage.init(named: "DoctaLogo")!
        let imageview : UIImageView = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
        self.navigationController?.navigationBar.addSubview(imageview)
        
        
        //background Image
        
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "homescreenbackground")?.draw(in: self.view.bounds)
        let backgroundimage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: backgroundimage)
        
        
        
        
        
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
        
     
        // Signup Button
        let button = UIButton.init(type: .custom)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik", size: 15)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 90, height: 35)
        button.addTarget(self, action: #selector(SignupButton), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
//        
//        let emptybutton = UIBarButtonItem.init(title: "Menu", style: UIBarButtonItemStyle.done, target: self, action: #selector(revealSideBarfromButton))
        
//        let menuButton = UIButton.init(type: .custom)
//        menuButton.setImage(UIImage.init(named: "home"), for: UIControlState.normal)
//        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        menuButton.addTarget(self, action: #selector(SignupButton), for: .touchUpInside)
//        let menuBarButton = UIBarButtonItem(customView: menuButton)
//        menuBarButton.imageInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        let SignupBarButton = UIBarButtonItem.init(image: UIImage.init(named: "useraccount"), style: UIBarButtonItemStyle.done, target: self, action: #selector(SignupButton))
        
       let menuButton = UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: UIBarButtonItemStyle.done, target: self, action: #selector(revealSideBarfromButton))
        
        let homeButton = UIBarButtonItem.init(image: UIImage.init(named: "home"), style: UIBarButtonItemStyle.done, target: self, action: #selector(GotoHomeButton))
        let notificationbutton = UIBarButtonItem.init(image: UIImage.init(named: "notification"), style: UIBarButtonItemStyle.done, target: self, action: #selector(notificationButton))
       
        
        self.navigationItem.rightBarButtonItems = [menuButton, SignupBarButton,notificationbutton, homeButton]
        
        // Do any additional setup after loading the view.
    }
    
    
   public func revealSideBarfromButton() {
        
        sideMenuController?.toggle()
        
        
    }
    
    func notificationButton() {
        SVProgressHUD.showInfo(withStatus: "Coming Soon...")
        SVProgressHUD.dismiss(withDelay: 2)
        
    }
    
    public func GotoHomeButton() {
        
        //casesTabbar
        let token  = (UserDefaults.standard.object(forKey: "AccessToken"))
        if token != nil {
            let storyboard = UIStoryboard(name: "SubmitCase", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "casesTabbar")
            self.navigationController?.pushViewController(controller, animated: true)
            
            
        }
        else {
            ReviewCasefileManager.sharedInstance.AuthRedirection = "Casefilelist"
            let storyboard = UIStoryboard(name: "Auth", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
            self.navigationController?.pushViewController(controller, animated: true)
            
            
        }
        
        
        
        
        
    }
    
    func SignupButton() {
        
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
        
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
                SVProgressHUD.dismiss()
            }
            if (error != nil) {
                print("Error is \(String(describing: error))")
                SVProgressHUD.showError(withStatus: "Error! Please check you internet connection")
                SVProgressHUD.dismiss(withDelay: 3)
            }
        }
        
    }
    
   
    
    func setupDropDowns() {
        specialistDropdown.anchorView = clinicNametextfield
        
        
        specialistDropdown.dataSource = SpcialistiesNames
        specialistDropdown.direction = .any
        specialistDropdown.textColor = UIColor.darkGray
       // specialistDropdown.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 166/255, blue: 255/255, alpha: 1)
        specialistDropdown.backgroundColor = UIColor.groupTableViewBackground
        specialistDropdown.selectionBackgroundColor = UIColor.lightGray
        specialistDropdown.cellHeight = 35
        specialistDropdown.bottomOffset = CGPoint(x: 0, y:30)
        locationdropdown.bottomOffset = CGPoint(x: 0, y:30)
        
        
        
        specialistDropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.clinicNametextfield.text = "  " + item
            ReviewCasefileManager.sharedInstance.SpecialistyName = item
            self.SelectedSpecialities = item
            print("Selected Specialist is \(self.SelectedSpecialities) at index \(index)")
            self.SelectedSpecialtyDict = self.Specilistlist[index]
            
            if !self.selectedLocation.isEmpty && !self.SelectedSpecialities.isEmpty {
                self.SearchandUpdateSpecialists()
                SVProgressHUD.show()
            }
            else {
                
            }
            
            
        }
        
        
        locationdropdown.anchorView = locationTextField
        locationdropdown.dataSource = LocationsList
        locationdropdown.direction = .bottom
        locationdropdown.textColor = UIColor.darkGray
       // locationdropdown.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 166/255, blue: 255/255, alpha: 1)
        locationdropdown.backgroundColor = UIColor.groupTableViewBackground
        locationdropdown.selectionBackgroundColor = UIColor.lightGray
        locationdropdown.cellHeight = 35
        
        locationdropdown.selectionAction = {
            [unowned self] (index: Int, item: String) in
            self.locationTextField.text = "  " + item
            ReviewCasefileManager.sharedInstance.CountryName = item
            self.selectedLocation = item
            print("Selected Procedure is \(self.selectedLocation) at index \(index)")
            if !self.selectedLocation.isEmpty && !self.SelectedSpecialities.isEmpty {
                SVProgressHUD.show()
                self.SearchandUpdateSpecialists()
            }
            
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
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End Editing")
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
        
        if SpecialistListFromServer.count > 0 {
            self.performSegue(withIdentifier: "ShowSpecialist", sender: self)
        }
        else {
            SVProgressHUD.showInfo(withStatus: "All Fields Are Mandetory")
            SVProgressHUD.dismiss(withDelay: 1)
            
            
        }
        
    }
        
        
        
        
//        let storyboard = UIStoryboard(name: "CreateNewCase", bundle: nil)
//        let controller :Step1ReasonsTVC  = storyboard.instantiateViewController(withIdentifier: "Step1VC") as! Step1ReasonsTVC
//        controller.SelectedLocationText = selectedLocation
//        controller.SelectedSpecialities = SelectedSpecialities
//        self.navigationController?.pushViewController(controller, animated: true)
//        
//
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return SpecialistListFromServer.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionViewSpecialists.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageLabelCollectionViewCell
//        
//        
//        let dict : NSDictionary = SpecialistListFromServer[indexPath.row]
//        if(dict.allKeys.count > 0) {
//            let APIimage:String = dict.value(forKey: "image") as! String
//            let imagestring : String = "https://account.docta.com" + APIimage
//            cell.cellImageView.sd_setImage(with: URL(string: imagestring), placeholderImage: UIImage(named: "doctordummyprofile"))
//            
//            let firstname : String = dict.value(forKeyPath: "name.first") as! String
//            let lastname : String = dict.value(forKeyPath: "name.last") as! String
//            
//            let doctorName : String = "Dr." + firstname + lastname
//            cell.titleLabel.text = doctorName
//            let cityName : String = dict.value(forKey: "city") as! String
//            cell.detailLabelCity.text = cityName
//            
//            
//            cell.Button.addTarget(self, action: #selector(CellButtonsClicked(_:)), for: UIControlEvents.touchUpInside)
//            if indexPath == cellselectedindex {
//                cell.layer.borderWidth = 2.0
//                cell.layer.borderColor = UIColor.black.cgColor
//                cell.backgroundColor = UIColor.groupTableViewBackground
//                
//            }
//            else {
//                cell.layer.borderWidth = 0.5
//                cell.layer.borderColor = UIColor.lightGray.cgColor
//                cell.backgroundColor = UIColor.white
//                
//            }
//            
//            
//            
//        }
//        else {
//            
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("did select row \(indexPath.row)")
//        
//        
//        if (SpecialistListFromServer.count != 0) {
//            self.SelectedDoctor = self.SpecialistListFromServer[indexPath.row]
//            self.performSegue(withIdentifier: "doctorsProfile", sender: self)
//            
//            
//        }
//        else {
//            print("Select All fields first")
//        }
//        
//        
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//       
//        
//        
//    }
//    
//    func CellButtonsClicked(_ sender:UIButton) {
//        
//        let buttonPosition:CGPoint = sender.convert(.zero, to: self.collectionViewSpecialists)
//        let indexPath:IndexPath = self.collectionViewSpecialists.indexPathForItem(at: buttonPosition)!
//        let cell = collectionViewSpecialists.cellForItem(at: indexPath)
//        ReviewCasefileManager.sharedInstance.SelectedSpecialist = SpecialistListFromServer[indexPath.row]
//       
//        
//        if indexPath == cellselectedindex {
//            
//            if cellselection {
//                cell?.layer.borderWidth = 0.5
//                cell?.layer.borderColor = UIColor.lightGray.cgColor
//                cell?.backgroundColor = UIColor.white
//                self.cellselection = false
//            }
//            else {
//                cell?.layer.borderWidth = 2.0
//                cell?.layer.borderColor = UIColor.black.cgColor
//                cell?.backgroundColor = UIColor.groupTableViewBackground
//                self.cellselection = true
//            }
//            
////            self.cellselectedindex = IndexPath()
////            self.cellselection = false
//            
//        }
//        else {
//            
//            
//            if (cellselection) {
//                let cell2 = self.collectionViewSpecialists.cellForItem(at: cellselectedindex)
//                cell2?.layer.borderWidth = 0.5
//                cell2?.layer.borderColor = UIColor.lightGray.cgColor
//                cell2?.backgroundColor = UIColor.white
//            }
//            
//            
//            cell?.layer.borderWidth = 2.0
//            cell?.layer.borderColor = UIColor.black.cgColor
//            cell?.backgroundColor = UIColor.groupTableViewBackground
//            self.cellselectedindex =  self.collectionViewSpecialists.indexPath(for: cell!)!
//            self.cellselection = true
//            self.collectionViewSpecialists.reloadData()
//            
//        }
//        
//        
//        
//        print("Button clicked \(indexPath.row)")
//        
//    }
//    
    
    func SearchandUpdateSpecialists() {
        let APIsession : APIHandler = APIHandler()
        
        ReviewCasefileManager.sharedInstance.SpecialityIDSelected = SelectedSpecialtyDict.value(forKey: "_id") as! String
        if SelectedSpecialtyDict.value(forKey: "description") != nil {
             ReviewCasefileManager.sharedInstance.SelectedSpecialityDescription = SelectedSpecialtyDict.value(forKey: "description") as! String
        }
        
        let parameters =
        [ "country": selectedLocation, "speciality": SelectedSpecialtyDict.value(forKey: "_id")]
        
        APIsession.getDatafromAPI("POST", "specialists", parameters) { (response, error) in
            if (response != nil) {
                print(response)
                SVProgressHUD.dismiss()
                let json : NSDictionary = response as! NSDictionary
                
                self.responseObject = json.value(forKey: "data") as! NSDictionary
                
                self.SpecialistListFromServer = self.responseObject.value(forKey: "specialists") as! Array<NSDictionary>
                if self.SpecialistListFromServer.count > 0 {
                    SVProgressHUD.dismiss()
                    
                  //  self.collectionViewSpecialists.reloadData()
                }
                else {
                    
                    
                    SVProgressHUD.showError(withStatus: "There are no specialists matched to you.")
                    SVProgressHUD.dismiss(withDelay: 2)
                  //  self.collectionViewSpecialists.reloadData()
                }
                
            }
            if (error != nil) {
                print("Error is \(String(describing: error))")
                SVProgressHUD.showError(withStatus: "Error!, Please check you internet connection")
                SVProgressHUD.dismiss(withDelay: 2)
                
            }
        }
        

        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSpecialist" {
            if let nextViewController = segue.destination as? UITabBarController{
                let destinationVc = nextViewController.viewControllers?[0] as? SpecialistsListViewController
                    destinationVc?.DoctorslistFiltered = self.SpecialistListFromServer
                  //  destinationVc?.SpecialistID = SelectedDoctor.value(forKey: "_id") as! String
                
            }
            
        }
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        
        SVProgressHUD.dismiss()
        
        
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
