//
//  Persistence.swift
//  FriendFace
//
//  Created by Natasha Godwin on 9/8/21.
//

import CoreData

struct PersistenceController {
	static let shared = PersistenceController()
	let container: NSPersistentContainer
	
	init() {
		container = NSPersistentContainer(name: "FriendFace")
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("\(error)")
			}
		}
	}
}
