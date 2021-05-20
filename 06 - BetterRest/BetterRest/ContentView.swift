//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 5/19/21.
//

import SwiftUI

/*
 
 Notes
 
 
 
 */


struct ContentView: View {
    @State private var sleepAmount: Double = 8.0
    @State private var wakeUpTime = Date()
    var body: some View {
        NavigationView {
            Form {
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                DatePicker("Please choose a date", selection: $wakeUpTime, in: Date()...)
                    .labelsHidden()
            }
            .navigationTitle("BetterRest")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
