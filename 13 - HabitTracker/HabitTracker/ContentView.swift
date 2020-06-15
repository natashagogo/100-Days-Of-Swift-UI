//
//  ContentView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/13/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var list = Habits()
    @State private var showingAddHabit = false
    var body: some View {
        NavigationView {
            List {
                ForEach(list.items) { item in
                    NavigationLink(destination: HabitDetail(habit: item)) {
                        HStack {
                            Text("\(item.name)")
                            Text("\(item.count)")
                        }
                    }
                }
              .onDelete(perform: removeItem)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    self.showingAddHabit = true
            }){
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabit(habits: self.list)
        }
        .environmentObject(list)
    }
    
    func removeItem(at locations: IndexSet) {
        list.items.remove(atOffsets: locations)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
