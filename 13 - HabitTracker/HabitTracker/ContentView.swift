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
    var body: some View {
        NavigationView {
            List {
                ForEach(list.items) { item in
                    HStack {
                        Text("\(item.name)")
                        Spacer()
                        Text("\(item.count)")
                    }
                }
              .onDelete(perform: removeItem)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                let habit = Habit(name: "Sketching", count: 1)
                self.list.items.append(habit)
            }){
                Image(systemName: "plus")
            })
        }
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
