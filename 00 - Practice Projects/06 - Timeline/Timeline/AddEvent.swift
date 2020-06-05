//
//  AddEvent.swift
//  Timeline
//
//  Created by Natasha Godwin on 6/5/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct AddEvent: View {
    @State private var name = ""
    @ObservedObject var events: EventList
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                TextField("Event Name", text: $name)
            }
           .navigationBarTitle("Add Event")
            .navigationBarItems(trailing: Button("Save") {
                let item = Event(name: self.name)
                self.events.list.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent(events: EventList())
    }
}
