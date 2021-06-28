//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Natasha Godwin on 6/28/21.
//

import SwiftUI

struct ListView: View {
    @State private var addingNewHabit = false
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { number in
                    NavigationLink(destination: UpdateProgressView()) {
                        Text("\(number)")
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
    }
}
