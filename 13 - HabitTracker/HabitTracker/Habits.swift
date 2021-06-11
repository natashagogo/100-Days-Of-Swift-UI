//
//  List.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import Foundation

class Habits: ObservableObject {
    @Published var list = [Habit]()
}
