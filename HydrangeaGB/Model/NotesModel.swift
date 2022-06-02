//
//  NotesModel.swift
//  HydrangeaGB
//
//  Created by KKK on 27.05.2022.
//

import Foundation

public struct NotesModel {
    var id: UUID
    var date: String
    var title: String
    var text: String?
}

//var notesList: [NotesModel] = [NotesModel(id: UUID(),
//                                          date: "10.04.2022",
//                                          title: "обрезка"),
//                               NotesModel(id: UUID(),
//                                          date: "29.04.2022",
//                                          title: "первые побеги",
//                                          text: "hi, макбоок макБУК БУК МАК ну и ну hi, макбоок макБУК БУК МАК ну и нуhi, макбоок макБУК БУК МАК ну и нуhi, макбоок макБУК БУК МАК ну и ну")]
//    .sorted(by: {$0.date < $1.date})
//
//
//
//func saveNotes(note: NotesModel) {
//    if let idnx = notesList.firstIndex(where: { $0.id == note.id }) {
//        notesList[idnx] = note
//    } else {
//        notesList.append(note)
//    }
//}
