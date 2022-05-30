//
//  PhotoDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 20.05.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var images = [Photo]()
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var imCollection: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setCustomNavigationBar()
        viewPhoto()
    }
}

// MARK:  настройка CustomNavigationBar
extension PhotoDetailViewController {
    func setCustomNavigationBar() {
        customNavigationBar.delegate = self
        customNavigationBar.backButton.hiddenFalse()
        customNavigationBar.titleLabel.hiddenTrue()
    }
}

// Кнопка Back
extension PhotoDetailViewController: NavigationBarDelegate {
    func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension PhotoDetailViewController {
    func viewPhoto() {

        let scrollViewWidth:CGFloat = imCollection.frame.width
        let scrollViewHeight:CGFloat = imCollection.frame.height

        for index in 0..<images.count {
            let imageView = UIImageView(frame: CGRect(x: scrollViewWidth * CGFloat(index),y: 0,width: scrollViewWidth,height: scrollViewHeight))
            imageView.image = UIImage(named: images[index].name)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true

            imCollection.addSubview(imageView)
        }

        imCollection.contentSize = CGSize(width: imCollection.frame.width * CGFloat(images.count), height: imCollection.frame.height)
        
        imCollection.backgroundColor = UIColor.clear
    }
}
