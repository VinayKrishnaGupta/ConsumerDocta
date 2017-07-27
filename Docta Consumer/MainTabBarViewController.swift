//
//  MainTabBarViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 27/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

//        
//        UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"docovaMainTabBarController"];
//        tbc.selectedIndex=1;
//        [self presentViewController:tbc animated:YES completion:nil];
//        
//        let storyboard = UIStoryboard(name: "CreateNewCase", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "CreateCaseNav")
//        self.present(controller, animated: true, completion: nil)

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
