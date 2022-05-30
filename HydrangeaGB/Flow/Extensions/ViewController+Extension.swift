//
//  ViewController+Extension.swift
//  HydrangeaGB
//
//  Created by KKK on 26.05.2022.
//

import UIKit

// MARK: hide Keyboard WhenT apped Around
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
