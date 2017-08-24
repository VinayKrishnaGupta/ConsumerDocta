//
//  ImageLabelCollectionViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 19/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class ImageLabelCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var detailLabelCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
