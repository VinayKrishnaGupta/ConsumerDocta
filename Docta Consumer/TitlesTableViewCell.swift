//
//  TitlesTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class TitlesTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
