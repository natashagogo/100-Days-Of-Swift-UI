//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/13/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct AddHabit: View {
    @State private var name = ""
    @State private var unit = "Count"
    @State private var goal = ""
    
    static let units = ["Count", "Minutes"]
    
    @ObservedObject var habits: Habits
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit", text: $name)
                TextField("Goal", text: $goal)
                    .keyboardType(.numberPad)
                Picker("Unit", selection: $unit) {
                    ForEach(Self.units, id: \.self) {
                        Text($0)
                    }
                }
                .labelsHidden()
                .pickerStyle(SegmentedPickerStyle())
            }
        .navigationBarTitle("Create New Habit")
            .navigationBarItems(trailing: Button("Save") {
                self.addHabit()
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func addHabit() {
        let habit = Habit(name: name, goal: goal, unit: unit, count: 0)
        habits.items.append(habit)
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
