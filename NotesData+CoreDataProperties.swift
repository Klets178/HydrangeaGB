//
//  NotesData+CoreDataProperties.swift
//  HydrangeaGB
//
//  Created by KKK on 29.05.2022.
//
//

import Foundation
import CoreData


extension NotesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotesData> {
        return NSFetchRequest<NotesData>(entityName: "NotesData")
    }

    @NSManaged public var date: String?
    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var title: String?

}

extension NotesData : Identifiable {

}
