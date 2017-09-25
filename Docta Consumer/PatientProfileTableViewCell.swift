//
//  PatientProfileTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 25/09/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class PatientProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var patientGender: UILabel!
    @IBOutlet weak var patientAge: UILabel!
    @IBOutlet weak var PAtientNationality: UILabel!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var NationalityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
