//
//  OpenCaseViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 31/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class OpenCaseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
        
        
    let image : UIImage = UIImage.init(named: "DoctaLogo")!
    let imageview : UIImageView = UIImageView.init(image: image)
    imageview.frame = CGRect(x: 10, y: 2, width: 100, height: 30)
    self.navigationController?.navigationBar.addSubview(imageview)
    
        
        

    
  //   collectionView.register(OpenCasesCollectionViewCell.self, forCellWithReuseIdentifier: "OpenCasesCollectionViewCell")
        
        //self.collectionView.register("OpenCasesCollectionViewCell", forCellWithReuseIdentifier: "Cell")
       // collectionView.register(OpenCasesCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OpenCell", for: indexPath) as! OpenCasesCell
            cell.backgroundColor = UIColor.white
        
            return cell
     
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
