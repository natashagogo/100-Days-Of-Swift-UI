//
//  Habits.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/13/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import Foundation


class Habits: ObservableObject {
    @Published var items = [Habit]()
}
