//
//  Habits.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import Foundation

/*struct Progress {
    var date: Date
    var amount: Int
}*/

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var goal: String
    var metric: String
    var frequency: String
    var progress: Int
    
    var formattedGoal: String {
        return "\(progress)/\(goal) \(metric)"
    }
    
    var unwrappedGoal: Int {
        Int(goal) ?? 0
   }
}

final class Habits: ObservableObject {
    @Published var list = [Habit]()
}
