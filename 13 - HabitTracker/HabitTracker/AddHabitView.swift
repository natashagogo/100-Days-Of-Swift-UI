//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var goal = ""
    @State private var metric = "count"
    @State private var frequency = "daily"
    
    let metrics = ["minutes", "count"]
    let frequencies = ["daily", "weekly", "monthly"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Goal", text: $goal)
                Picker("", selection: $metric) {
                    ForEach(metrics, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Picker("", selection: $frequency) {
                    ForEach(frequencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .navigationTitle("New Habit")
            .navigationBarItems(trailing: Button("Add") {
                saveAndExit()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    private func saveAndExit() {
    
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
