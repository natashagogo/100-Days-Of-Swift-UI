//
//  ContentView.swift
//  BetterRest
//
//  Created by Natasha Godwin on 5/19/21.
//

import SwiftUI

/*
    NOTES
    This app would be more useful if it told you how many cups of coffee to drink, based on your desired wake-up time.
*/


struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Wake Up Time")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section(header: Text("Hours of Sleep")) {
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                Section(header: Text("Estimated Caffeine Intake")) {
                    Stepper(value: $coffeeAmount, in: 0...20) {
                        if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }
                Section(header: Text("Recommended Bedtime")) {
                    Text("\(calculatedBedtime)")
                }
            }
            .navigationBarTitle("BetterRest")
        }
    }
    
    var calculatedBedtime: String {
        // Create an instance of the SleepCalculator class
        let model = SleepCalculator()
        
        /* The prediction method requires quantitative values (doubles) for its parameters. So, here, we need to convert the hour and minute into seconds, using dateComponents
        */
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60 // in seconds
        let minute = (components.minute ?? 0) * 60 // in seconds
        var bedTime: String
    
        do {
            // Will calculate how much sleep the user needs (in seconds)
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            // To convert that value into a time, we'll subtract this value from the time they need to wake up
            let sleepTime = wakeUp - prediction.actualSleep
            // Convert from a Date to a String
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            bedTime = formatter.string(from: sleepTime)
            
        } catch {
            bedTime = "Error"
        }
        return bedTime
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
