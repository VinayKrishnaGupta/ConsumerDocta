//
//  ImageCollectionTableViewCell.swift
//  Docta Consumer
//
//  Created by RSTI E-Services on 11/08/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

import UIKit
import ImagePicker
import Lightbox
import SDWebImage
import Metal

class ImageCollectionTableViewCell: UITableViewCell, UICollectionViewDataSource,ImagePickerDelegate , UICollectionViewDelegate {
    let imagepicker = ImagePickerController()
    var imagearray  = [UIImage]()
    

    @IBOutlet weak var colletionViewImages: UICollectionView!
    
    var numberofRows : Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colletionViewImages.dataSource = self
        colletionViewImages.delegate = self
         imagepicker.delegate = self
        // Initialization code
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagearray.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = colletionViewImages.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! imagesviewCollectionViewCell
       
        
        if indexPath.row == 0 {
            // cell.cellImageView.image = UIImage.init(named: "folderplus")
            cell.imageViewofCell.image = UIImage.sd_animatedGIFNamed("plusgif")
        }
        else {
            cell.imageViewofCell.image = imagearray[indexPath.row-1]
            
        }

        
        
        
        
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selcted Cell is \(indexPath.row)")
        if indexPath.row == 0 {
            self.selectImagefromGalleryandCamera()
        }

        
    }
    
    func selectImagefromGalleryandCamera() {
        var config = Configuration()
        config.doneButtonTitle = "Finish"
        config.noImagesTitle = "Sorry! There are no images here!"
        config.recordLocation = false
        //  config.allowVideoSelection = false
        
        
        imagepicker.configuration = config
        imagepicker.delegate = self
        
       
        
     //   present(imagepicker, animated: true, completion: nil)
        
        let newVC : UIViewController = (UIApplication.shared.keyWindow?.rootViewController)!

        newVC.present(imagepicker, animated: true, completion: nil)
        
//        UIViewController* activeVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//        [activeVC presentViewController:'new view controller'
//            animated:YES
//            completion:NULL];
        
    
        
        
        
        
    }
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
        let lightboxImages = images.map {
            return LightboxImage(image: $0)
        }
        
        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagearray = images
        colletionViewImages.reloadData()
        imagePicker.dismiss(animated: true, completion: nil)
    }

    
    
    // change background color when user touches cell
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
