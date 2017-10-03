//
//  OpenCasesCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 01/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class OpenCasesCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        
        profileImageView.layer.cornerRadius = 35
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1).cgColor
        
        
    
//        backgroundImageView.tintColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1)
//    backgroundImageView.image = UIImage.init(named: "casefileBackground")
//        
//        
    }



}


