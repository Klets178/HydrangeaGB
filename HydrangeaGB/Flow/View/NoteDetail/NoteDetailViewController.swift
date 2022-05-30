//
//  NoteDetailViewController.swift
//  HydrangeaGB
//
//  Created by KKK on 10.05.2022.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController {
    
    var noteOne = NotesModel(id: UUID(), date: DateFormatter.setDateFormat(date: Date()), title: String())

    var pickerView = UIView()

    @IBOutlet weak var customNavigationBar: NavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var dateStack: UIStackView!
    @IBOutlet weak var noteTitle: UITextField! {
        didSet { noteTitle.text = noteOne.title }
    }
    @IBOutlet weak var noteText: UITextView! {
        didSet { noteText.text = noteOne.text }
    }
    @IBOutlet weak var noteDate: UILabel! {
        didSet { noteDate.text = noteOne.date }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // keyboard
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
    
        setCustomNavigationBar()
        createDatePicker()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // keyboard
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func handleDateSelection(_ sender: UIDatePicker) {
        noteDate.text = DateFormatter.setDateFormat(date: sender.date)
        pickerView.isHidden = true
    }
    
    @IBAction func dateTouch(_ sender: Any) {
        pickerView.isHidden = false
    }
    
    @IBAction func okTouch(_ sender: Any) {
//        Repository().saveNote()

        noteOne.date = noteDate.text ?? String()
        noteOne.title = noteTitle.text ?? String()
        noteOne.text =  noteText.text
        saveNotes(note: noteOne)
        backAction()
    }
}

// MARK:  настройка CustomNavigationBar
extension NoteDetailViewController {
    func setCustomNavigationBar() {
        customNavigationBar.delegate = self
        customNavigationBar.titleLabel?.text = "ЗАМЕТКА"
        customNavigationBar.backButton.hiddenFalse()
    }
}

extension NoteDetailViewController: NavigationBarDelegate {
    func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension NoteDetailViewController {
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
     
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
 }
 
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }

    @objc override func hideKeyboard() {
        scrollView?.endEditing(true)
    }
}

extension NoteDetailViewController {
    func createDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.date = Date()
        datePicker.locale = .current
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
        pickerView.addSubview(datePicker)
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: dateButton.bottomAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: datePicker.widthAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalTo: datePicker.heightAnchor).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        pickerView.backgroundColor = UIColor.colorHydrangea
        pickerView.cornerRadius = 32
        pickerView.borderWidth = 1
        pickerView.layer.shadowColor = UIColor.black.cgColor
        pickerView.layer.shadowOpacity = 1
        pickerView.layer.shadowOffset = .zero
        pickerView.layer.shadowRadius = 8
        pickerView.isHidden = true
    }
}



