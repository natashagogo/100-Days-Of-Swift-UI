//
//  Habit.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import Foundation

struct Habit: Identifiable {
    var id = UUID()
    var name: String
    var goal: String
    var unit: String
    var frequency: String
    var count: Int
}

struct Count: Identifiable {
    var id = UUID()
    var count: Int
    var date: Date
}
