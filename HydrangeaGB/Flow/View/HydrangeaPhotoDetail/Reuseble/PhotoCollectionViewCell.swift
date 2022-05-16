//
//  PhotoCollectionViewCell.swift
//  HydrangeaGB
//
//  Created by KKK on 11.05.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(photo: UIImage) {
        self.photo.image = photo
    }
    
}
