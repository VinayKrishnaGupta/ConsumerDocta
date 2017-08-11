//
//  collectionTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 10/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit

class collectionTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colletionViewImages.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LabelsCollectionViewCell
        cell.titleLabel.text =  listofValues[indexPath.row]
        
        
        if indexPath.row == selectedindex
        {
            cell.contentView.backgroundColor = UIColor.lightGray
        }
        else {
            cell.contentView.backgroundColor = UIColor.orange
        }   
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selcted Cell is \(indexPath.row)")
        let cell : UICollectionViewCell = colletionViewImages.cellForItem(at: indexPath)!
        selectedindex = indexPath.row
        cell.contentView.backgroundColor = UIColor.lightGray
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell : UICollectionViewCell = colletionViewImages.cellForItem(at: indexPath)!
        cell.contentView.backgroundColor = UIColor.orange
    }
    
    // change background color when user touches cell
        

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
