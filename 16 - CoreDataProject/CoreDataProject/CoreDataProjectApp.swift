//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 8/6/21.
//

import SwiftUI
import CoreData

@main
struct CoreDataProjectApp: App {
	let persistenceContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
					.environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
