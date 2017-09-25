//
//  LabelsCollectionViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class LabelsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        self.layoutIfNeeded()
       // self.autoresizesSubviews = true
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(red:1, green:0.63, blue:0.12, alpha:1).cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
        
      //  self.frame = CGRect(0, self.frame.origin.y, self.superview!.frame.size.width, self.frame.size.height)
      //  self.frame = CGRect.init(x: 0, y: self.frame.origin.y, width: ((self.superview?.frame.size.width)!/4), height: self.frame.size.height)
        
        
    }
    
}
