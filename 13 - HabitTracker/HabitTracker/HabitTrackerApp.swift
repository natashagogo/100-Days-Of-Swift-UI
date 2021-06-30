//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    @StateObject var habits = HabitList()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(HabitList())
        }
    }
}
