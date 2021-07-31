//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Natasha Godwin on 6/16/21.
//

import SwiftUI

@main
struct BookwormApp: App {
	// Insert the container created in Persistence.swift, so all views have access to the same data.
	let persistenceContainer = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
					.environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
