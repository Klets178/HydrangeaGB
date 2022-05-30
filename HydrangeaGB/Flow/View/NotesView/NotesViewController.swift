//
//  NotesViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 03.05.2022.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {

 
    
    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var tableNotes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableNotes()
        setCustomNavigationBar()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        tableNotes.reloadData()
     }
}


// MARK:  настройка tableHydrangea
extension NotesViewController {
    func setTableNotes() {
        tableNotes.delegate = self
        tableNotes.dataSource = self
        tableNotes.registerCell(type: NotesTableViewCell.self)
    }
}

// MARK:  настройка CustomNavigationBar
extension NotesViewController {
    func setCustomNavigationBar() {
        customNavigationBar.delegate = self
        customNavigationBar.titleLabel?.text = "ЗАМЕТКИ"
        customNavigationBar.addButton?.hiddenFalse()
    }
}

// MARK: кнопка Добавить открывваеся NoteDetailStoryboardм
extension NotesViewController: NavigationBarDelegate {
    func addAction() {
        let storyboard = UIStoryboard(name: "NoteDetailStoryboard", bundle: nil)
        guard
            let photoViewController = storyboard.instantiateViewController(identifier: "NoteDetailStoryboard") as? NoteDetailViewController
        else { return }
        navigationController?.pushViewController(photoViewController, animated: true)
    }
}

// MARK: - Table view delegate methods
extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notesList.count == 0 ? tableView.setEmptyMessage("ОЙ, заметок нет.") : tableView.restore()
        return notesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueCell(withType: NotesTableViewCell.self, for: indexPath) as? NotesTableViewCell
        else { return UITableViewCell() }

        cell.configure(with: notesList[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDetailNote(row: indexPath.row)
    }
}

// MARK: - goto HydrangeaDetailStoryboard
extension NotesViewController {
    func toDetailNote(row: Int) {
        let storyboard = UIStoryboard(name: "NoteDetailStoryboard", bundle: nil)
        guard
            let detailViewController = storyboard.instantiateViewController(identifier: "NoteDetailStoryboard") as? NoteDetailViewController
        else { return }
        
        detailViewController.noteOne = notesList[row]

        navigationController?.pushViewController(detailViewController, animated: true)
     }
}

