//
//  Repository.swift
//  HydrangeaGB
//
//  Created by KKK on 27.05.2022.
//

import Foundation
import CoreData

class Repository {
    
    private let coreData = CoreData.coreData
    
    func saveNote(note: NotesModel) {
        let context = coreData.context
        let noteData = NotesData(context: context)
        noteData.id = UUID()
        noteData.date = note.date
        noteData.text = note.text
        noteData.title = note.title
        coreData.saveContext()
    }
}
