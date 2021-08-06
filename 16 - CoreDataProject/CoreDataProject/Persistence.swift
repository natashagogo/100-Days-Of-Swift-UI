//
//  Persistence.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/6/21.
//

import CoreData

struct PersistenceController {
	static let shared = PersistenceController()
	let container: NSPersistentContainer
	
	init() {
		container = NSPersistentContainer(name: "CoreDataProject")
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("\(error)")
			}
		}
		
	}
}
