//
//  Persistence.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 6/20/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        // This container is used to load and save data from device storage
        container = NSPersistentContainer(name: "SymptomTracker")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("\(error)")
            }
            
        }
    }
}


