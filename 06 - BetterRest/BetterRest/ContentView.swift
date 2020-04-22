//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 4/20/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUpTime = defaultWakeTime
    @State private var hoursOfSleep = 8.0
    @State private var cupsOfCoffee = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                     .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
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
            
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK"))
        )}
    }
    func calculateBedTime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
        let hour = (components.hour ?? 0) * 60 * 60 // in seconds
        let minute = (components.minute ?? 0) * 60 // in seconds
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: hoursOfSleep, coffee: Double(cupsOfCoffee))

            let sleepTime = wakeUpTime - prediction.actualSleep // convert seconds into a bedtime
            
            let formatter = DateFormatter() // presents date as a string
            formatter.timeStyle = .short

            alertMessage = formatter.string(from: sleepTime)
            alertTitle = "Your ideal bedtime is…"
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
