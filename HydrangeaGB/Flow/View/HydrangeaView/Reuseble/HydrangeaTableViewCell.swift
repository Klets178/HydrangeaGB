//
//  HydrangeaTableViewCell.swift
//  HydrangeaGB
//
//  Created by KKK on 05.05.2022.
//

import UIKit

class HydrangeaTableViewCell: UITableViewCell {


    @IBOutlet weak var huydrangeaImage: UIImageView!
    @IBOutlet weak var hydrangeaName: UILabel!
    @IBOutlet weak var hydrangeaSubname: UILabel!
    
    
    
    func configure(with value: Character ) {
    
        huydrangeaImage.image = UIImage(named: value.avatar)
        hydrangeaName.text = value.name
        hydrangeaSubname.text = value.subname
    }
    
}
