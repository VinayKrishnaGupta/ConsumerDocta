//
//  ReviewCasefileManager.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 25/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class ReviewCasefileManager: NSObject {

//from Step 1
    var CountryName = String()
    var SpecialistyName = String()
    var SelectedSpecialist = NSDictionary()
    
//Patient profile : Step 4
    var PatientName = String()
    var PatientAge = Int()
    var PatientGender = String()
    var PatientNationality = String()
    
//Step2: Symptoms : Step 2
    var HowLong = String()
    var Q1WhyneedSpecialist = String()
    var Q2HowProblemStart = String()
    var Q3Symptoms = String()
    var ImageArrayBodyparts = Array<UIImage>()
    
//Step3: Treatment History : Step 3
    var Q4TreatmentHistory = String()
    var Q5MedicalConditions = String()
    var Q6AddtionalInformation = String()
    var ImageArrayReportsAndReferral = Array<UIImage>()
    
    
    static let sharedInstance:ReviewCasefileManager = {
        let instance = ReviewCasefileManager ()
        return instance
    } ()
    
    override init() {
        super.init()
    }
    
    

}
