//
//  OpenCaseViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 31/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage

class OpenCaseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var PageControl: UIPageControl!
    let codedLabel:UILabel = UILabel()
    var screenSize = CGRect()
    public var OpenCasesList = Array<NSDictionary>()

    override func viewDidLoad() {
        super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    SVProgressHUD.show()
        
        
        
    let image : UIImage = UIImage.init(named: "DoctaLogo")!
    let imageview : UIImageView = UIImageView.init(image: image)
    imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
    self.navigationController?.navigationBar.addSubview(imageview)
    PageControl.currentPage = 0
    screenSize = UIScreen.main.bounds
    
        
        
        
        let SignupBarButton = UIBarButtonItem.init(image: UIImage.init(named: "useraccount"), style: UIBarButtonItemStyle.done, target: self, action: #selector(SignupButton))
        
        let menuButton = UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: UIBarButtonItemStyle.done, target: self, action: #selector(revealSideBarfromButton))
        
        let homeButton = UIBarButtonItem.init(image: UIImage.init(named: "createcasefile"), style: UIBarButtonItemStyle.done, target: self, action: #selector(GotoHomeButton))
        let notificationbutton = UIBarButtonItem.init(image: UIImage.init(named: "notification"), style: UIBarButtonItemStyle.done, target: self, action: #selector(notificationButton))
        
        
        self.navigationItem.rightBarButtonItems = [menuButton, SignupBarButton,notificationbutton, homeButton]
        
        // Do any additional setup after loading the view.
    }
    
    
    func revealSideBarfromButton() {
        
        sideMenuController?.toggle()
        
        
    }
    
    func notificationButton() {
        SVProgressHUD.showInfo(withStatus: "Coming Soon...")
        SVProgressHUD.dismiss(withDelay: 2)
        
    }
    
    func GotoHomeButton() {
        
        //createcasefile
        self.navigationController?.popViewController(animated: false)
        
    }
    
    func SignupButton() {
        
        
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignupVC")
        self.navigationController?.pushViewController(controller, animated: true)
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      //  PageControl.hidesForSinglePage = true
        PageControl.numberOfPages = OpenCasesList.count
        self.collectionView.reloadData()
        print("Open Case file in VC is \(OpenCasesList)")
        
    }
    public func ReloadData() {
        print("Open Case file in VC is \(OpenCasesList)")
        
        if OpenCasesList.count < 1 {
        self.codedLabel.isHidden = false
            self.codedLabel.frame = CGRect(x: 100, y: 100, width: self.view.frame.height/2, height: self.view.frame.height/2)
            self.codedLabel.textAlignment = .center
            self.codedLabel.text = "You don't have any casefile yet, Please create one."
            self.codedLabel.numberOfLines=2
            self.codedLabel.layer.cornerRadius = 20
            self.codedLabel.textColor=UIColor.white
            self.codedLabel.font=UIFont.systemFont(ofSize: 18)
          //  self.codedLabel.backgroundColor=UIColor(red:0.08, green:0.65, blue:1, alpha:1)
            self.view.addSubview(self.codedLabel)
            self.codedLabel.translatesAutoresizingMaskIntoConstraints = false
            self.codedLabel.heightAnchor.constraint(equalToConstant: self.view.frame.height/2).isActive = true
            self.codedLabel.widthAnchor.constraint(equalToConstant: self.view.frame.height/2).isActive = true
            self.codedLabel.centerXAnchor.constraint(equalTo: self.codedLabel.superview!.centerXAnchor).isActive = true
            self.codedLabel.centerYAnchor.constraint(equalTo: self.codedLabel.superview!.centerYAnchor).isActive = true
            
        }
        else {
            self.codedLabel.isHidden = true
        }
        
        SVProgressHUD.dismiss()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*4/5, height: self.view.frame.height*3/5)
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: self.view.frame.width/10, bottom: 5, right: self.view.frame.width/10)
    }
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return OpenCasesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OpenCell", for: indexPath) as! OpenCasesCell
            cell.backgroundColor = UIColor.white
        let dict : NSDictionary = OpenCasesList[indexPath.section]
        let Specialistity : String = dict.value(forKeyPath: "speciality.name") as! String
        let doctortitle : String = dict.value(forKeyPath: "specialist.title") as! String
        let doctorfirstname : String = dict.value(forKeyPath: "specialist.name.first") as! String
        let doctorLastname : String = dict.value(forKeyPath: "specialist.name.last") as! String
        
        
        let specialistName: String = doctortitle + " " + doctorfirstname + " " + doctorLastname
        
        let Cityname : String = dict.value(forKeyPath: "specialist.city") as! String
        let Countryname : String = dict.value(forKeyPath: "specialist.country") as! String
        cell.titleLabel.text = Specialistity
        cell.specialistLabel.text = specialistName
        cell.locationLabel.text = Cityname + ", " + Countryname
        
        
        let APIimage:String = dict.value(forKeyPath: "specialist.image") as! String
        let imagestring : String = "https://account.docta.com" + APIimage
        cell.profileImageView.sd_setImage(with: URL(string: imagestring), placeholderImage: UIImage(named: "doctordummyprofile"))
        
       
            
        
            return cell
     
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        self.PageControl.currentPage = indexPath.section
//        
//        
//    }
    func scrollViewDidEndDecelerating(_ scrollView:UIScrollView) {
        PageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
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
