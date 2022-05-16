//
//  HydrangeaPhotoDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 11.05.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var idPhoto: Int? = nil
    lazy var photo = Photo(id: 0, name: String())
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigationBar.delegate = self
        
        customNavigationBar.backButton.doVisible()
        customNavigationBar.titleLabel.doHidden()
        
        photoImage.image = UIImage(named: photo.name)

    }
    
}

// Кнопка Back
extension PhotoDetailViewController: NavigationBarDelegate {
    func backAction() {
            self.navigationController?.popViewController(animated: true)
    }
}
