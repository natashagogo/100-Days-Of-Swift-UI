//
//  ContentView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import SwiftUI

struct DetailView: View {
    @State var habit: Habit
    var body: some View {
        VStack {
            Text("\(habit.count) / \(habit.goal)")
               .font(.largeTitle)
            Text("\(habit.unit)")
                .font(.headline)
                .foregroundColor(.gray)
            Stepper("", value: $habit.count, in: 0...Int(habit.goal)!, step: Int(habit.goal) ?? 1)
                .labelsHidden()
          }
            .navigationBarTitle(Text(habit.name), displayMode: .inline)
    }
}

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var addingNewHabit = false
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.list) { habit in
                    NavigationLink(destination: DetailView(habit: habit)) {
                        HStack {
                            Text("\(habit.name)")
                            Spacer()
                            if habit.count == Int(habit.goal) {
                                Text("Done!")
                            } else {
                                Text("\(habit.goal) \(habit.unit)")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.addingNewHabit = true
            }) {
                Image(systemName: "plus")
                    .font(.title)
            })
            .sheet(isPresented: $addingNewHabit) {
                AddHabit(habits: self.habits)
            }
        }
    }
    
    func delete(at location: IndexSet) {
        // TO DO: Ask user to confirm before deleting items.
        habits.list.remove(atOffsets: location)
    }
    
    func showAlert(title: String, message: String) {
        showingAlert = true
        alertTitle = title
        alertMessage = message
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
