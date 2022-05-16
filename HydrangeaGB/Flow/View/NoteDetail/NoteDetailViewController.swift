//
//  NoteDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 10.05.2022.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigationBar.delegate = self
        
        customNavigationBar.backButton.doVisible()
    }
    

}

extension NoteDetailViewController: NavigationBarDelegate {
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
