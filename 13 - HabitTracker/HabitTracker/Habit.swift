//
//  Habit.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/13/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation


struct Habit: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let unit: String
    let goal: String
}
