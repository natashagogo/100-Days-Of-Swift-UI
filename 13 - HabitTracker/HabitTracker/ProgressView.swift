//
//  ProgressView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct ProgressView: View {
    @EnvironmentObject var habits: HabitList
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.list) { habit in
                    HStack {
                        Text(habit.name)
                        Spacer()
                        Text("\(habit.progress)")
                    }
                }
            }
            .navigationTitle("Progress")
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
            .environmentObject(HabitList())
    }
}
