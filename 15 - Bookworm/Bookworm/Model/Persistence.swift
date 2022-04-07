//
//  Persistence.swift
//  Bookworm
//
//  Created by Natasha Godwin on 7/31/21.
//

import CoreData

/*
 This creates the container that is used to load and save data from device storage. 
*/

struct PersistenceController {
	static let shared = PersistenceController()
	let container: NSPersistentContainer
	
	init() {
		container = NSPersistentContainer(name: "Bookworm")
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("\(error)")
			}
		}
	}
}

	
