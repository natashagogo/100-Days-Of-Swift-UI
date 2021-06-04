//
//  ContentView.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/3/21.
//

import SwiftUI

/*
 TO DO:
 
 1. Create an DetailView, where users can read and edit the entire entry.
 2. Create a custom style for the list.
 3. Save user data.
 4. Sort entries by date.
 
 */

struct ContentView: View {
    @ObservedObject var events = EventList()
    @State private var addingEvent = false
    
    var body: some View {
        NavigationView {
           Timeline(events: self.events)
             .navigationBarTitle("Timeline")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.addingEvent.toggle()
                }) {
                Image(systemName: "plus")
                    .font(.title)
            })
         }
        .sheet(isPresented: $addingEvent) {
            AddEvent(events: self.events)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
