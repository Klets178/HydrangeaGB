//
//  HydrangeaDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 28.04.2022.
//

import UIKit

class HydrangeaDetailViewController: UIViewController {
    
    var character = Character(id: 0, photo: [Photo](), avatar: "", name: "", subname: "", text: "")
        
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var photoCollection: UICollectionView!
    
    @IBOutlet weak var subnameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPhotoCollection()
        setCustomNavigationBar()
        loadInfoHydrangea()
    }
}

// MARK:  настройка photoCollection
extension HydrangeaDetailViewController {
    func setPhotoCollection() {
        photoCollection.delegate = self
        photoCollection.dataSource = self
        photoCollection.registerCell(type: PhotoCollectionViewCell.self)
    }
}

// MARK:  настройка CustomNavigationBar
extension HydrangeaDetailViewController {
    func setCustomNavigationBar() {
        customNavigationBar.delegate = self
        customNavigationBar.backButton?.hiddenFalse()
    }
}

// Кнопка Back
extension HydrangeaDetailViewController: NavigationBarDelegate {
    func backAction() {
        navigationController?.popViewController(animated: true)
    }
}


extension HydrangeaDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return character.photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueCell(withType: PhotoCollectionViewCell.self, for: indexPath) as? PhotoCollectionViewCell
        else { return PhotoCollectionViewCell() }
        
        let photoName = character.photo[indexPath.row].name
        
        cell.configure(photo: UIImage(named: photoName) ?? UIImage())
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        toPhotoView(row: indexPath.row)
    }
}


// Открываем PhotoDetailStoryboard
extension HydrangeaDetailViewController {
    func toPhotoView(row: Int) {
        let storyboard = UIStoryboard(name: "PhotoDetailStoryboard", bundle: nil)
        guard
            let photoController = storyboard.instantiateViewController(identifier: "PhotoDetailStoryboard") as? PhotoDetailViewController
        else { return }
        photoController.images = character.photo
        navigationController?.pushViewController(photoController, animated: true)
    }
}

// показываем информацию о гортензии
extension HydrangeaDetailViewController {
    func loadInfoHydrangea() {
        customNavigationBar.titleLabel?.text = character.name
        textView.text = character.text
        subnameLabel.text = character.subname
    }
}
