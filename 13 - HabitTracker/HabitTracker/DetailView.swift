//
//  UpdateProgressView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var habits: HabitList
    @State var habit: Habit
    var body: some View {
        VStack {
            Text("\(habit.progress)% Complete")
                .font(.largeTitle)
            ProgressBar(value: $habit.progress)
        }
        .navigationBarTitle("Habit Progress", displayMode: .inline)
    }
}

struct UpdateProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(habit: Habit(name: "Reading", goal: "45", metric: "minutes", frequency: "daily", progress: 0))
            .environmentObject(HabitList())
    }
}
