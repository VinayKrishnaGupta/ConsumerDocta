//
//  OpenCasesCollectionViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 31/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class OpenCasesCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var locationCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        locationCollectionView.dataSource = self
        locationCollectionView.delegate = self
        // Initialization code
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 : UICollectionViewCell = locationCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! LocationOpenCasesCollectionViewCell
        
        return cell2
        
        
    }
    
    
    

}
