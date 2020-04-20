//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 4/20/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUpTime = Date()
    @State private var hoursOfSleep = 8.0
    @State private var cupsOfCoffee = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                     .labelsHidden()
                }
                
                Section(header: Text("How much sleep do you want?")) {
                    Stepper(value: $hoursOfSleep, in: 4...12, step: 0.25) {
                        Text("\(hoursOfSleep, specifier: "%g") hours")
                    }
                }
                
                Section(header: Text("How much coffee do you drink?")) {
                    Stepper(value: $cupsOfCoffee, in: 1...20) {
                        if cupsOfCoffee == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(cupsOfCoffee) cups")
                        }
                    }
                }
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing: Button(action: calculateBedTime) {
                Text("Get Bedtime")
            })
            
        }
    }
    func calculateBedTime() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
