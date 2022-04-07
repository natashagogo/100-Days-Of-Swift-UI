//
//  UpdateProgressView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct DetailView: View {
    @EnvironmentObject var habits: HabitList
    @State var habit: Habit
    var body: some View {
        VStack {
            Text("\(habit.progress)% Complete")
                .font(.largeTitle)
            ProgressBar(value: $habit.progress.onChange(updateProgress))
        }
        .navigationBarTitle("Habit Progress", displayMode: .inline)
    }
    
    func updateProgress(_ newValue: Int) {
        habit.progress = newValue
    }
}

struct UpdateProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habit: Habit(name: "Reading", goal: "45", metric: "minutes", frequency: "daily", progress: 0))
            .environmentObject(HabitList())
    }
}
