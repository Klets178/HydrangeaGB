//
//  HydrangeaPhotoDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 11.05.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIGestureRecognizerDelegate {

    var idPhoto: Int? = nil
    lazy var photo = Photo(id: 0, name: String())
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet var swipeToRigth: UISwipeGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigationBar.delegate = self
        swipeToRigth.delegate = self
        self.view.addGestureRecognizer(swipeToRigth)
                
        customNavigationBar.backButton.doVisible()
        customNavigationBar.titleLabel.doHidden()
        
        photoImage.image = UIImage(named: photo.name)

    }
    
    
    @IBAction func swipeToRightAction(_ sender: Any) {
        photoImage.image = UIImage(named: "icon194")
    }
    
}

// Кнопка Back
extension PhotoDetailViewController: NavigationBarDelegate {
    func backAction() {
            self.navigationController?.popViewController(animated: true)
    }
}
