//
//  Habits.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id = UUID()
    var name: String
    var goal: String
    var metric: String
    var frequency: String
    var progress: Int 
}

class HabitList: ObservableObject {
    @Published var list = [Habit]() {
        didSet {
            // Create an instance of JSONEncoder
            let encoder = JSONEncoder()
            // Convert data to JSON
            if let encoded = try? encoder.encode(list) {
                // Write the data to UserDefaults
                UserDefaults.standard.set(encoded, forKey: "List")
            }
        }
    }
    
    init() {
        // Read the "Items" key from UserDefaults
        if let list = UserDefaults.standard.data(forKey: "List") {
            // Create an instance of JSONDecoder
            let decoder = JSONDecoder()
            // Convert JSON to ExpenseItem objects
            // Note: [ExpenseItem].self is used to refer to the type itself, so the compiler doesn't get confused.
            if let decoded = try? decoder.decode([Habit].self, from: list) {
                self.list = decoded
                return
            }
        }
        self.list = []
    }
}
