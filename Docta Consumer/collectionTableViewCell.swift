//
//  collectionTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class collectionTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var colletionViewImages: UICollectionView!
    var selectedindex : Int = -1
    var numberofRows : Int = 1
    var listofValues : Array = ["1","2","3"]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colletionViewImages.dataSource = self
        colletionViewImages.delegate = self
        
        
        
        // Initialization code
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberofRows
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.colletionViewImages.frame.width/4, height: 40)
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colletionViewImages.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LabelsCollectionViewCell
        cell.titleLabel.text =  listofValues[indexPath.row]
        
        cell.layer.borderWidth = 0.25
       
      
        cell.layer.borderColor = UIColor(red:1, green:0.63, blue:0.12, alpha:1).cgColor
        
        if indexPath.row == selectedindex
        {
            cell.contentView.backgroundColor = UIColor.init(colorLiteralRed: 255/255, green: 206/255, blue: 74/255, alpha: 1)
            cell.titleLabel.textColor = UIColor.init(colorLiteralRed: 255/255, green: 98/255, blue: 2/255, alpha: 1)
            
        }
        else {
            cell.contentView.backgroundColor = UIColor.groupTableViewBackground
            cell.titleLabel.textColor = UIColor.gray
        }   
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selcted Cell is \(indexPath.row)")
        let cell : LabelsCollectionViewCell = colletionViewImages.cellForItem(at: indexPath)! as! LabelsCollectionViewCell
        selectedindex = indexPath.row
        cell.contentView.backgroundColor = UIColor.init(colorLiteralRed: 255/255, green: 206/255, blue: 74/255, alpha: 1)
        cell.titleLabel.textColor = UIColor.init(colorLiteralRed: 255/255, green: 98/255, blue: 2/255, alpha: 1)
        ReviewCasefileManager.sharedInstance.HowLong = cell.titleLabel.text!
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell : LabelsCollectionViewCell = colletionViewImages.cellForItem(at: indexPath)! as! LabelsCollectionViewCell
        cell.contentView.backgroundColor = UIColor.groupTableViewBackground
        cell.titleLabel.textColor = UIColor.gray
    }
    
    // change background color when user touches cell
        

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        colletionViewImages.layer.cornerRadius = 5
        colletionViewImages.layer.borderColor = UIColor(red:1, green:0.63, blue:0.12, alpha:1).cgColor
        colletionViewImages.layer.borderWidth = 0.5
        colletionViewImages.layer.masksToBounds = true
        colletionViewImages.collectionViewLayout.invalidateLayout()
        
    }
    

}
