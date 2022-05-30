//
//  RoudingEdgesSearchBar.swift
//  HydrangeaGB
//
//  Created by KKK on 24.05.2022.
//

import UIKit

class RoudingEdgesSearchBar: UISearchBar {
    @IBInspectable var borderColorNew: UIColor = .gray
    @IBInspectable var borderWidthNew: CGFloat = 1.5
    @IBInspectable var cornerNew: CGFloat = 3
   
   override func awakeFromNib() {
       barTintColor = .colorHydrangea
       searchTextField.backgroundColor = .colorHydrangea
       layer.cornerRadius = bounds.height / cornerNew
       layer.masksToBounds = true
       layer.borderWidth = borderWidthNew
       layer.borderColor = borderColorNew.cgColor
   }
}
