//
//  NotesViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 03.05.2022.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var tableNotes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNavigationBar.delegate = self
        
        customNavigationBar.titleLabel.text = "ЗАМЕТКИ"
        customNavigationBar.addButton.doVisible()

     }
    
}

// кнопка Добавить открывваеся NoteDetailStoryboardм
extension NotesViewController: NavigationBarDelegate {
    func addAction() {
        let storyboard = UIStoryboard(name: "NoteDetailStoryboard", bundle: nil)
        guard
            let photoViewController = storyboard.instantiateViewController(identifier: "NoteDetailStoryboard") as? NoteDetailViewController
        else { return }

        show(photoViewController, sender: nil)
    }
}

