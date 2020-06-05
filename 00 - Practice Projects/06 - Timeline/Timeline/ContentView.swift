//
//  ContentView.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/1/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var events = EventList()
    var body: some View {
        NavigationView {
            List {
                ForEach(events.list) { event in
                    Text("\(event.name)")
                }
                .onDelete(perform: removeEvent)
            }
            .navigationBarTitle("Timeline")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action:{
                let newEvent = Event(name: "Test")
                self.events.list.append(newEvent)
            }) {
                Image(systemName: "plus")
            })
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

