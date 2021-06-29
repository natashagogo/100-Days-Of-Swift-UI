//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var habits: Habits
    @State private var addingNewHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.list) { habit in
                    NavigationLink(destination: UpdateProgressView(habit: habit)) {
                        Text("\(habit.name)")
                    }
                }
            }
            .navigationTitle("Habits")
            .navigationBarItems(trailing: Button(action:  {
                addingNewHabit.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $addingNewHabit) {
                AddHabitView()
            }
        }
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(Habits())
    }
}
