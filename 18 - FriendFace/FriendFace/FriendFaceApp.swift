//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Natasha Godwin on 8/25/21.
//

import SwiftUI

@main
struct FriendFaceApp: App {
	@StateObject var users = Users()
    var body: some Scene {
        WindowGroup {
            ContentView()
					.environmentObject(users)
        }
    }
}
