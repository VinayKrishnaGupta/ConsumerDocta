//
//  DoctorsIntroTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 23/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class DoctorsIntroTableViewCell: UITableViewCell {
    @IBOutlet weak var imageviewdoctor: UIImageView!
    @IBOutlet weak var titleLabelDoctor: UILabel!
    @IBOutlet weak var detailLabelCity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        imageviewdoctor.layer.cornerRadius = 40
        imageviewdoctor.layer.masksToBounds = true
        imageviewdoctor.layer.borderWidth = 2
        imageviewdoctor.layer.borderColor = UIColor(red:0.08, green:0.65, blue:1, alpha:1).cgColor
    }

}
