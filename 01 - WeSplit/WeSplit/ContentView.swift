//
//  ContentView.swift
//  WeSplit
//
//  Created by Natasha Godwin on 5/6/21.
//

import SwiftUI

/*
 Notes
 
 TextFields can only contain strings.
 
 @State automatically looks for changes and reinvokes the body property whenever one is made.
 
 .keyboardType() is a modifier that takes the type of keyboard you want to show as a parameter.
 
 Declarative user interface design - saying what you want rather than specifying how it should be done
 
 If a form needs to show other views, it needs to be embedded within a NavigationView, which allows other views to slide on top of existing ones.
 
 The modifier .navigationBarTitle() should be attached to a view inside NavigationView, not NavigationView itself, which is a container for multiple views.
 
 You can add a specifier parameter to an interpolated string containing a number to limit the number of decimal places shown. For example, "%.2f" means a "two-digit floating-point number" and will display numbers with two decimal places. This specifier comes from the C programming language.
 
 */


struct ContentView: View {
    @State private var amountOwed = "" // Text fields can only contain strings
    @State private var numberOfPeople = 2 // This is an index number, not the actual number of people, so the third option will be selected by default
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var getCheck: (total: Double, splitTotal: Double) {
        let peopleCount = Double(numberOfPeople + 2) // Add two to the index number to get the correct number of people
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
                            Text("\(tipPercentages[percentage])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Grand Total")) {
                    Text("\(getCheck.total, specifier: "%.2f")")
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
