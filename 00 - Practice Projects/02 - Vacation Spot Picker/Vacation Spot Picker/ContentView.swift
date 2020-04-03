//
//  ContentView.swift
//  Vacation Spot Picker
//
//  Created by Natasha Godwin on 4/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var vacationSpots = ["Tokyo", "Taipei", "Maui", "Malmö"]
    @State private var selectedDestination = 0
   
    var body: some View {
        VStack {
            Text("Where do you wanna go next?")
                .font(.headline)
            Picker("Where do you want to go?", selection: $selectedDestination) {
                ForEach(0 ..< vacationSpots.count) {
                    Text(self.vacationSpots[$0])
                }
            }.labelsHidden()
            Text("You chose: ")
            Text("\(vacationSpots[selectedDestination].uppercased())")
                .foregroundColor(.blue)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
