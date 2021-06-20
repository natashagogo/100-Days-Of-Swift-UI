//
//  SymptomTrackerApp.swift
//  SymptomTracker
//
//  Created by Natasha Godwin on 5/25/21.
//

import SwiftUI

@main
struct SymptomTrackerApp: App {
    // This inserts the container created in Persistence.swift, so all views can access the information.
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
