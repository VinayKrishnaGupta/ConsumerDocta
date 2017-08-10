//
//  LabelsTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class LabelsTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label1detail: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label2detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
