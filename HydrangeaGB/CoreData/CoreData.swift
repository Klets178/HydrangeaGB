//
//  CoreData.swift
//  HydrangeaGB
//
//  Created by KKK on 27.05.2022.
//

import Foundation
import CoreData

class CoreData {
    
    static let coreData = CoreData()
    init() {}
        
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NotesData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
      }()

    lazy var context: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        return context
    }()
    

    
    // MARK: - Core Data Saving support
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
