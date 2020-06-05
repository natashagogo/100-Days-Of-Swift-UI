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
    @State private var description = ""
    @State private var date = Date()
    
    @ObservedObject var events: EventList
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Event Name", text: $name)
                TextField("Description", text: $description)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
            }
           .navigationBarTitle("Add Event")
            .navigationBarItems(trailing: Button("Save") {
                self.addEvent()
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
    func addEvent() {
        let item = Event(name: self.name, description: self.description, date: self.date)
        events.list.append(item)
    }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent(events: EventList())
    }
}
