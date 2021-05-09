//
//  ContentView.swift
//  TimeTraveler
//
//  Created by Natasha Godwin on 5/9/21.
//

import SwiftUI


struct ContentView: View {
    @State private var entry = ""
    @State private var inputSelected = 1 // index number
    @State private var outputSelected = 0 // index number
    
    let units: [String] = [
        "minutes",
        "hours",
        "days"
    ]
    
    var convertNumber: Double {
        let userEntry = Double(entry) ?? 0
        let result: Double
        
        let minutesInHour: Double = 60
        let minutesInDay: Double = 1440
        
        let inputSelection = units[inputSelected]
        let outputSelection = units[outputSelected]
        
        let minute = units[0]
        let hour = units[1]
        let day = units[2]
        
        switch (inputSelection, outputSelection) {
          case (minute, hour):
            result = userEntry / minutesInHour
          case (minute, day):
            result = userEntry / minutesInDay
          case (hour, day):
            result = userEntry * minutesInHour / minutesInDay
          case (hour, minute):
            result = userEntry * minutesInHour
          case (day, minute):
            result = userEntry * minutesInDay
          case (day, hour):
            result = userEntry * minutesInDay / minutesInHour
          default:
            result = userEntry
        }
        
        
        return result
    
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Number", text: $entry)
                }
                
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputSelected) {
                        ForEach(0..<units.count) { unit in
                            Text("\(self.units[unit])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputSelected) {
                        ForEach(0..<units.count) { unit in
                            Text("\(self.units[unit])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("There are \(convertNumber, specifier: "%.2f") \(units[outputSelected]) in \(entry) \(units[inputSelected]) ")
                }
                
                
            }
            .navigationBarTitle("Time Traveler")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
