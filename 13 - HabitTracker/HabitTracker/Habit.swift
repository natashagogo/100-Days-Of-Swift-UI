//
//  Habit.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var goal: String
    var unit: String
    var frequency: String
    var progress: Int
}

struct Count: Identifiable {
    var id = UUID()
    var date: Date
    var count: Int
}
