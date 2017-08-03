//
//  SettingsTab4ViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 03/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit


class SettingsTab4ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image : UIImage = UIImage.init(named: "DoctaLogo")!
        let imageview : UIImageView = UIImageView.init(image: image)
        imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
        self.navigationController?.navigationBar.addSubview(imageview)
        
        self.imageView1.image = UIImage.sd_animatedGIFNamed("underconstructiongif")
        self.imageView2.image = UIImage.sd_animatedGIFNamed("coomingsoongif")
        self.navigationItem.title = "Settings"
        
    

        // Do any additional setup after loading the view.
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
