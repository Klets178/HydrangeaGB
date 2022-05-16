//
//  HydrangeaDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 28.04.2022.
//

import UIKit

/// # HydrangeaDetailViewController
/// - subnameLabel -  subname Hydrangea
/// - textLabel          -  text Hydrangea
///
///
class HydrangeaDetailViewController: UIViewController {
    
    lazy var character = Character(id: 0, photo: [Photo](), avatar: "", name: "", subname: "", text: "")
        
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var photoCollection: UICollectionView!
    
    @IBOutlet weak var subnameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollection.delegate = self
        photoCollection.dataSource = self
        
        customNavigationBar.delegate = self
        
        photoCollection.registerCell(type: PhotoCollectionViewCell.self)
                
        customNavigationBar.backButton.doVisible()
        
        loadInfoHydrangea()

    }
    
}

// Кнопка Back
extension HydrangeaDetailViewController: NavigationBarDelegate {
    func backAction() {
            self.navigationController?.popViewController(animated: true)
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
            let photoViewController = storyboard.instantiateViewController(identifier: "PhotoDetailViewController") as? PhotoDetailViewController
        else { return }
        photoViewController.photo = character.photo[row]

        show(photoViewController, sender: nil)
    }
}

// показываем информацию о гортензии
extension HydrangeaDetailViewController {
    func loadInfoHydrangea() {
        customNavigationBar.titleLabel.text = character.name
        textLabel.text = character.text
        subnameLabel.text = character.subname
    }
    
}
