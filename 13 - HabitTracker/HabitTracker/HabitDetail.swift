//
//  HabitDetail.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/14/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct HabitDetail: View {
    @ObservedObject var habits: Habits
    @State var completedTimes: Int = 0
    
    var habitId: UUID
    var habit: Habit {
        habits.getHabit(id: habitId)
    }
    
    var body: some View {
        Form {
            Text("\(habit.name)")
            Text("\(habit.goal) \(habit.unit) \(habit.frequency)")
            Stepper(
                onIncrement: { self.updateHabit(by: 1)},
                onDecrement: { self.updateHabit(by: -1)},
                label: { Text("Completed \(habit.completedTimes) time(s)")}
            )
        }
        .navigationBarTitle("\(habit.name)")
    }
    
    func updateHabit(by change: Int) {
        var habit = self.habit
        habit.completedTimes += change
        self.habits.update(habit: habit)
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habits: Habits(), habitId: UUID())
    }
}


