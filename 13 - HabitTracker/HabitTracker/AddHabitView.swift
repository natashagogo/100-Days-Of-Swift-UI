//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var habits: Habits
    @State var name = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("name")) {
                    TextField("Running", text: $name)
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
        let item = Habit(name: self.name)
        // TO DO: Add form validation
        habits.list.append(item)
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
