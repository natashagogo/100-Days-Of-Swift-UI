//
//  ContentView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/11/21.
//

import SwiftUI

/*
 TO DO:
 
 There are a few problems with this app so far:
 1. Changes that are made in DetailView aren't being saved. The count goes back to zero after returning to the main view.
 2. These changes aren't being shared with the main view, either.
 
 Here's what I know:
 1. AddHabit is responsible for initializing each Habit object. So, it is the source of truth for the data.
 2. DetailView needs to be able to change that data.
 2. ContentView needs to display the data (and any changes made to it elsewhere)
 
 Question:
 I think I need to use @Binding in DetailView. But how?
 
 */

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
