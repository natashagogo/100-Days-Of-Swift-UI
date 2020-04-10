//
//  ContentView.swift
//  Unit-Converter
//
//  Created by Natasha Godwin on 4/4/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var inputSelected = 0 // mg is default input
    @State private var outputSelected = 1 // mcg is default output
    
    let units = ["milligram (mg)", "microgram(mcg)"]
    
    var convertUnits: Double {
        let userAmount = Double(amount) ?? 0
        let amountInMicrograms: Double = userAmount * 1000 // 1 mg = 1,000 mcg
        let amountInMilligrams: Double = userAmount * 0.001 // 1 mcg = 0.001 mg
        
        let inputSelection = units[inputSelected]
        let outputSelection = units[outputSelected]
        
        let milligrams = units[0]
        let micrograms = units[1]
        
        switch (inputSelection, outputSelection) {
            case (milligrams, micrograms):
                return amountInMicrograms
            
            case (micrograms, milligrams):
                return amountInMilligrams
            
            default:
                return userAmount
            
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter Amount", text: $amount)
                    .keyboardType(.decimalPad)
                
                Section(header: Text("Units")) {
                    Picker("Input", selection: $inputSelected) {
                        ForEach(0..<units.count) {
                           Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Picker("Output", selection: $outputSelected) {
                        ForEach(0..<units.count) {
                           Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(convertUnits, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
