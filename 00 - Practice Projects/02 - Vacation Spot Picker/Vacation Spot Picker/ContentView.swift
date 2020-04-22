//
//  ContentView.swift
//  Vacation Spot Picker
//
//  Created by Natasha Godwin on 4/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var vacationSpots = [
        "Tokyo",
        "Osaka",
        "Maui"
    ]
    
    @State private var selectedDestination = 0
    @State private var selectedDate = Date()
   
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Next Destination")) {
                    Picker("Where do you want to go?", selection: $selectedDestination) {
                        ForEach(0 ..< vacationSpots.count) {
                          Text((self.vacationSpots[$0]))
                       }
                     }.labelsHidden()
                    
                    DatePicker("Departure", selection: $selectedDate, in: Date()...)
                }
            }.navigationBarTitle("Trip Picker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
