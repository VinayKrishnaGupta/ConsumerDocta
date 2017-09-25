//
//  imagesviewCollectionViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SDWebImage

class imagesviewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewofCell: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }
    override func layoutSubviews() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
    }
    
}
