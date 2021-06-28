//
//  UpdateProgressView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI


struct UpdateProgressView: View {
    @State var habit: Habit
    
    var range: ClosedRange<Int> {
        return 0...habit.unwrappedGoal
    }
    
    var body: some View {
        VStack {
            Text("\(habit.progress)/\(habit.goal)")
                .font(.largeTitle)
            Text("\(habit.metric)")
                .font(.caption)
                .textCase(.uppercase)
                .foregroundColor(.gray)
                
            Stepper("", value: $habit.progress, in: range, step: habit.unwrappedGoal)
                .labelsHidden()
        }
        .navigationBarTitle("\(habit.name)", displayMode: .inline)
    }
}

struct UpdateProgressView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProgressView(habit: Habit(name: "Reading", goal: "30", metric: "count", frequency: "daily", progress: 0))
    }
}
