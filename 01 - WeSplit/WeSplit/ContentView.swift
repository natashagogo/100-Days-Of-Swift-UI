//
//  ContentView.swift
//  WeSplit
//
//  Created by Natasha Godwin on 5/6/21.
//

import SwiftUI


struct ContentView: View {
    @State private var amountOwed = "" // Text fields can only contain strings
    @State private var numberOfPeople = 2 // This is an index number, not the actual number of people
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var getCheck: (total: Double, splitTotal: Double) {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amountOwed) ?? 0
        
        let tipAmount: Double = (orderAmount / 100) * tipSelection
        let grandTotal: Double = orderAmount + tipAmount
        let amountPerPerson: Double = grandTotal / peopleCount
        
        return (total: grandTotal, splitTotal: amountPerPerson)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amountOwed)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Tip Amount")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) { percentage in
                            Text("\(self.tipPercentages[percentage])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Grand Total")) {
                    Text("$\(getCheck.total, specifier: "%.2f")")
                }
                Section(header: Text("Amount Per Person")) {
                    Text("$\(getCheck.splitTotal, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
