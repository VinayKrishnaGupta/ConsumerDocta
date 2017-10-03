//
//  OpenCaseViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 31/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD

class OpenCaseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var PageControl: UIPageControl!
    var screenSize = CGRect()

    override func viewDidLoad() {
        super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    PageControl.hidesForSinglePage = true
    PageControl.numberOfPages = 4
        
        
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OpenCell", for: indexPath) as! OpenCasesCell
            cell.backgroundColor = UIColor.white
        
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
