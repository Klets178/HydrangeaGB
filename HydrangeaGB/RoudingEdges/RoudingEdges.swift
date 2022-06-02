//
//  RoudingEdges.swift
//  HydrangeaGB
//
//  Created by KKK on 24.05.2022.
//

import UIKit

//@IBDesignable
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = frame.height / newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { return  UIColor(cgColor: layer.borderColor ?? UIColor.gray.cgColor) }
        set { layer.borderColor = newValue.cgColor }
    }

}
