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
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colletionViewImages.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! imagesviewCollectionViewCell
        cell.titleLabel.text =  String(indexPath.row)
        cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selcted Cell is \(indexPath.row)")
        let cell : UICollectionViewCell = colletionViewImages.cellForItem(at: indexPath)!
        cell.contentView.backgroundColor = UIColor.lightGray
        
    }
    
    // change background color when user touches cell
        

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
