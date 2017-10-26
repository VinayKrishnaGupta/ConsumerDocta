//
//  AboutUsViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 24/10/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "About Us"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        
        
        let button = UIButton.init(type: .custom)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rubik", size: 15)
        button.layer.cornerRadius = 13
        button.backgroundColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        button.addTarget(self, action: #selector(BackButton), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func BackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
