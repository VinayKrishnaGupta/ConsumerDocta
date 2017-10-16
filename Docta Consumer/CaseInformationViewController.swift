//
//  CaseInformationViewController.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 12/10/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import SVProgressHUD

class CaseInformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    public var SelectedCasefile = NSDictionary()
    var ImageArrayBodypart = Array<UIImage>()
    var ImageArrayReports = Array<UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.estimatedRowHeight = UITableViewAutomaticDimension
        TableView.rowHeight = UITableViewAutomaticDimension
        TableView.setNeedsLayout()
        TableView.layoutIfNeeded()
        TableView.tableFooterView = UIView()
        TableView.tableHeaderView = UIView()
       
        self.navigationItem.title = "Case Information"
        self.navigationItem.hidesBackButton = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.SelectedCasefile = ReviewCasefileManager.sharedInstance.CasefileSelected
        self.TableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 4 {
            return 6
        }
        if section == 2 {
            if ImageArrayBodypart.count < 1 {
                return 0
            }
            else {
                return 1
            }
        }
        if section == 3 {
            if ImageArrayReports.count < 1 {
                return 0
            }
            else {
                return 1
            }
        }
        
            
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.justified
        let titleAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: .headline), NSForegroundColorAttributeName: UIColor.darkGray]
        let subtitleAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: .subheadline),NSForegroundColorAttributeName:UIColor.black, NSParagraphStyleAttributeName:style]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)
        
        titleString.append(subtitleString)
        
        return titleString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if SelectedCasefile.count > 0 {
            if indexPath.section == 0 {
                
                let cell2 = TableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
                let patientName : String  = SelectedCasefile.value(forKeyPath: "name") as! String
                
                
                cell2.textLabel?.attributedText = makeAttributedString(title: "Patient Name ", subtitle: patientName)
                return cell2
            }
            
            //PatientProfile
            if indexPath.section == 1 {
                let patientprofileCell = tableView.dequeueReusableCell(withIdentifier: "PatientProfile", for: indexPath) as! PatientProfileTableViewCell
                
                let Age: Int = SelectedCasefile.value(forKeyPath: "age") as! Int
                let gender = SelectedCasefile.value(forKeyPath: "gender")
                let nationality = SelectedCasefile.value(forKeyPath: "nationality")
                patientprofileCell.patientAge.text = String(Age)
                patientprofileCell.patientGender.text = (gender as? String)
                patientprofileCell.PAtientNationality.text = (nationality as? String)
                patientprofileCell.GenderLabel.text = "Gender"
                patientprofileCell.AgeLabel.text = "Age"
                patientprofileCell.NationalityLabel.text = "Nationality"
                
                
                
                return patientprofileCell
            }
            
            
            if indexPath.section == 2 {
                let imagecell = tableView.dequeueReusableCell(withIdentifier: "ImagesCell", for: indexPath) as! ImageCollectionTableViewCell
                imagecell.HideCameraButton = true
                imagecell.imagearray = ReviewCasefileManager.sharedInstance.ImageArrayBodyparts
                
                return imagecell
            }
            
            if indexPath.section == 3 {
                let imagecell2 = tableView.dequeueReusableCell(withIdentifier: "ImagesCellreferal", for: indexPath) as! ImageCollectionTableViewCell
                imagecell2.HideCameraButton = true
                
                imagecell2.imagearray = ReviewCasefileManager.sharedInstance.ImageArrayReportsAndReferral
                return imagecell2
            }
                
                
                
            else {
                
                let cell3 = TableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
                if indexPath.section == 4 {
                    let Answer1 : String = SelectedCasefile.value(forKeyPath: "why") as! String
                    let Answer2: String = SelectedCasefile.value(forKeyPath: "start") as! String
                    let Answer3 : String = SelectedCasefile.value(forKeyPath: "symptoms") as! String
                    let Answer4 : String = SelectedCasefile.value(forKeyPath: "prior_treatment") as! String
                    let Answer5 : String = SelectedCasefile.value(forKeyPath: "history") as! String
                    let Answer6 : String = SelectedCasefile.value(forKeyPath: "additional_information") as! String
                    switch indexPath.row {
                    case 0:
                        cell3.textLabel?.attributedText = makeAttributedString(title: "Why do you need a specialist? ", subtitle: Answer1)
                        
                        
                    case 1:
                        cell3.textLabel?.attributedText = makeAttributedString(title: "How did this problem start? ", subtitle:Answer2)
                    case 2:
                        cell3.textLabel?.attributedText = makeAttributedString(title: "What are the symptoms? ", subtitle: Answer3)
                        
                    case 3:
                        cell3.textLabel?.attributedText = makeAttributedString(title: "What treatment have you had? ", subtitle: Answer4)
                        
                    case 4:
                        cell3.textLabel?.attributedText = makeAttributedString(title: "Do you have any medical conditions? ", subtitle: Answer5)
                        
                    case 5:
                        cell3.textLabel?.attributedText = makeAttributedString(title: "Any additional information? ", subtitle: Answer6)
                        
                    default:
                        break
                    }
                    
                }
                return cell3
            }
            
            
        }
       
        
        else {
         let cellX = TableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
            return cellX
        }
        
        
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.text = self.tableView(tableView, titleForHeaderInSection: section)
        header.textLabel?.font = UIFont(name: "Rubik-Medium", size: 20)
        header.textLabel?.textAlignment = NSTextAlignment.left
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Patient Profile"
        }
        if section == 2 {
            if ImageArrayBodypart.count > 0 {
                return "Symptoms images"
            }
            else {
                return nil
            }
            
        }
        
        if section == 4 {
            return "Case file"
        }
        if section == 3 {
            if ImageArrayReports.count > 0 {
                return "Reports and Referrals"
            }
            else {
                return nil
            }
            
        }
            
        else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5 {
            return 70
        }
        if indexPath.section == 2 {
            return 100
        }
        if indexPath.section == 3 {
            return 100
        }
        if indexPath.section == 1 {
            return 70
        }
        else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 20
        case 2:
         
                if ImageArrayBodypart.count > 0 {
                    return 30
                }
                else {
                    return 0
                }
                
           
        case 3:
           
                if ImageArrayReports.count > 0 {
                    return 30
                }
                else {
                    return 0
                }
                
          
        case 4:
            return 30
        case 1:
            return -10
        default:
            return 0
        }
        
    }
    
   
    
    
   
    
}

