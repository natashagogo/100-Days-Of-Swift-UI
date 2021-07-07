//
//  FriendFinderApp.swift
//  FriendFinder
//
//  Created by Natasha Godwin on 7/2/21.
//

import SwiftUI
import CoreData

@main
struct FriendFinderApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
