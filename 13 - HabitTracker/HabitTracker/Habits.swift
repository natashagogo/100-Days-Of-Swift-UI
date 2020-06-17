//
//  Habits.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/13/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation


class Habits: ObservableObject {
    @Published var items = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Habit].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
    // Helper Functions
    
    func update(habit: Habit) {
        guard let index = getIndex(habit: habit) else { return }
        items[index] = habit
    }
    
    func getHabit(id: UUID) -> Habit {
        guard let index = getIndex(id: id) else { return Habit(name: "", goal: "", unit: "", frequency: "", completedTimes: 0) }

        return items[index]
    }
    
    private func getIndex(habit: Habit) -> Int? {
        return items.firstIndex(where: { $0.id == habit.id })
    }

    private func getIndex(id: UUID) -> Int? {
        return items.firstIndex(where: { $0.id == id })
    }
}
