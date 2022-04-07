//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Natasha Godwin on 8/25/21.
//

import SwiftUI

@main
struct FriendFaceApp: App {
	let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
					.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
