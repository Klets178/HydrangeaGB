//
//  NotesTableViewCell.swift
//  HydrangeaGB
//
//  Created by KKK on 27.05.2022.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var noteDay: UILabel!
    @IBOutlet weak var noteWeek: UILabel!
    @IBOutlet weak var noteYear: UILabel!
    @IBOutlet weak var noteTitle: UILabel!
    
    func configure(with value: NotesModel ) {
        let dat = value.date.split(separator: ".")
        noteDay.text = dat[0].description
        noteWeek.text = dat[1].description
        noteYear.text = dat[2].description
        noteTitle.text = value.title
    }
    
}
