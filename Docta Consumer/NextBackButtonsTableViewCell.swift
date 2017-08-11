//
//  NextBackButtonsTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class NextBackButtonsTableViewCell: UITableViewCell {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
