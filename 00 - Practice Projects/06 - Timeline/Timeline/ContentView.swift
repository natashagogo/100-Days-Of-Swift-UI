//
//  ContentView.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

// TO-DOS
// Create custom views for the timeline and events.
// Embed the timeline in a ScrollView
// Figure out how to delete items from ScrollView
// Let users sort events by date (ascending and descending)
// Add tags to each event and ability to filter by category

struct ContentView: View {
    @ObservedObject var events = EventList()
    @State private var showingAddEvent = false
    var body: some View {
        NavigationView {
            List {
                ForEach(events.list) { event in
                    NavigationLink(destination: Text("\(event.description)")) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(event.name)")
                                .foregroundColor(.primary)
                            Text("\(event.formatDate)")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: removeEvent)
            }
            .navigationBarTitle("Timeline")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action:{
                    self.showingAddEvent = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddEvent) {
            AddEvent(events: self.events)
        }
    }
    
    func removeEvent(at locations: IndexSet) {
        events.list.remove(atOffsets: locations)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

