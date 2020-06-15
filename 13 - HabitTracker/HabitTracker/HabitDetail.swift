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
    @State private var completedTimes = 0
    var habit: Habit
    
    var body: some View {
        VStack {
            Text("\(habit.name)")
                .font(.largeTitle)
            Text("\(habit.goal) \(habit.unit)")
                .font(.title)
            Stepper(value: $completedTimes, step: 1) {
                Text("\(self.completedTimes)")
            }
            .frame(width: 200, height: 50)
        }
    }
}

struct HabitDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetail(habits: Habits(), habit: Habit(name: "Name", goal: "Goal", unit: "Count", completedTimes: 0))
    }
}


