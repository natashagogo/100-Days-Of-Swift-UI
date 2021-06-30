//
//  Habits.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var goal: String
    var metric: String
    var frequency: String
    var progress: Int 
}

class HabitList: ObservableObject {
    @Published var list = [Habit]()
}
