//
//  TextViewTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textview: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        let myColor = UIColor.darkText
        textview.layer.borderWidth = 1
        textview.layer.cornerRadius = 10
        textview.layer.borderColor = myColor.cgColor
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
