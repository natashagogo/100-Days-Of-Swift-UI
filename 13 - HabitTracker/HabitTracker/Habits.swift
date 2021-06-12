//
//  List.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import Foundation

class Habits: ObservableObject {
    @Published var list = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(list) {
                UserDefaults.standard.set(encoded, forKey: "List")
            }
        }
    }
    
    init() {
        if let list = UserDefaults.standard.data(forKey: "List") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: list) {
                self.list = decoded
                return
            }
        }
        self.list = []
    }
}
