//
//  CoreDataRepository.swift
//  HydrangeaGB
//
//  Created by KKK on 27.05.2022.
//

import Foundation
import CoreData

class CoreDataRepository {
    
    private let coreData = CoreData.coreData
    
    func saveNote(note: NotesModel) {
        let context = coreData.context
        let noteData = NotesData(context: context)
        noteData.id = note.id
        noteData.date = note.date
        noteData.text = note.text
        noteData.title = note.title
        coreData.saveContext()
    }
    
    func updateNote(note: NotesModel) {
        let context = coreData.context
        let fetchRequest: NSFetchRequest<NotesData> = NotesData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id=='\(note.id)'")
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                object.date = note.date
                object.text = note.text
                object.title = note.title
            }
            try context.save()
            print("Notes update - ok")
        } catch let error as NSError {
            print(error.localizedDescription)
        }

    }
    
    func deleteNoteID(id: UUID) {
        let context = coreData.context
        let fetchRequest: NSFetchRequest<NotesData> = NotesData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id=='\(id)'")
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            try context.save()
            print("Notes delete - ok")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteNotesForID(id: UUID) {
        let context = coreData.context
        let fetchRequest: NSFetchRequest<NotesData> = NotesData.fetchRequest()
        if let objects = try? context.fetch(fetchRequest) {
            for object in objects {
                if object.id == id {
                    context.delete(object)
                }
            }
        }
        do {
            try context.save()
            print("Notes delete - ok")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchNotesData() -> [NotesData] {
        var notesData: [NotesData] = []

        let context = coreData.context
        do {
            let fetchRequest: NSFetchRequest<NotesData> = NotesData.fetchRequest()
            notesData = try context.fetch(fetchRequest)
            print("Notes CoreData = \(notesData.count)" )
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return notesData
    }

    func notesDataToModel(notesData: [NotesData]) -> [NotesModel] {
        var notes: [NotesModel] = []
        notesData.forEach { item in
            let note = NotesModel(id: item.id ?? UUID(),
                                  date: item.date ?? String(),
                                  title: item.title ?? String(),
                                  text: item.text)
            notes.append(note)
        }
        return notes
    }

}
