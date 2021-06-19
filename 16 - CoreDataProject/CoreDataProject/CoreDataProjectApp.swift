//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Natasha Godwin on 6/19/21.
//

import SwiftUI
import CoreData

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
