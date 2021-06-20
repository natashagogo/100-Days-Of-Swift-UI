//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var habits: Habits
    @State private var name = ""
    @State private var goal = ""
    @State private var unit = "count"
    @State private var frequency = "Daily"
    @State private var progress = 0
    
    static let units = ["count", "minutes"]
    static let options = [
        "Daily",
        "Weekly",
        "Monthly"
    ]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("name")) {
                    TextField("Running", text: $name)
                }
                Section(header: Text("goal")) {
                    TextField("1 \(unit) per day", text: $goal)
                    Picker("Units", selection: $unit) {
                        ForEach(Self.units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("frequency")) {
                    Picker("", selection: $frequency) {
                        ForEach(Self.options, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("New Habit")
            .navigationBarItems(trailing: Button("Save") {
                self.addHabit()
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func addHabit() {
        let item = Habit(name: self.name, goal: self.goal, unit: self.unit, frequency: self.frequency, progress: self.progress)
        // TO DO: Add form validation
        habits.list.append(item)
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
