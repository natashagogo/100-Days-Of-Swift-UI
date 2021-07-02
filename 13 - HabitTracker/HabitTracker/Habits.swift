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

/*
 Alternative data structures
 
 1. Turn habit into a class
 
 struct HabitInfo: Identifiable {
     let id = UUID()
     var name: String
     var goal: String
     var metric: String
     var frequency: String
     var progress: Int
 }
 
 class Habit: ObservableObject {
    @Published var habit = HabitInfo(name: "", goal: "", metric: "count", frequency: "daily", progress: 0)
 }

 class HabitList: ObservableObject {
     @Published var list = [Habit]()
 }
 
 2. Create one big class
 
 class Habit: ObservableObject {
     let id = UUID()
     @Published var name: String
     @Published var goal: String
     @Published var metric: String
     @Published var frequency: String
     @Published var progress: Int
 
    init(name: String, goal: String, metric: String, frequency: String, progress: Int) {
        self.name = name
        self.goal = goal
        self.metric = metric
        self.frequency = frequency
        self.progress = progress
    }
 }
 
 */
