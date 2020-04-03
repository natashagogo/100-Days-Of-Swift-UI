//
//  ContentView.swift
//  Symptom Tracker
//
//  Created by Natasha Godwin on 4/2/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var newSymptom = ""
    @State private var currentLevel = 1
    @State private var feelsLike = 0
    @State private var howOften = 0
    @State private var impactsLife = false
    @State private var impactsJob = false
    
    let symptomLevels = ["low", "medium", "high"]
    let frequency = ["first occurence", "rarely", "sometimes", "frequently", "constantly"]
    let typesOfPain = ["n/a", "burning", "numbing", "tingling", "throbbing", "bursting", "sharp", "tight", "electrical", "pins and needles"]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("What's going on?")) {
                    HStack {
                        TextField("Symptom", text: $newSymptom)
                            .autocapitalization(.none)
                    }
                }
                
                Section(header: Text("How bad is it today?")) {
                    Picker("", selection: $currentLevel) {
                        ForEach(0..<symptomLevels.count) {
                            Text("\(self.symptomLevels[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("What does it feel like?")) {
                    Picker("", selection: $feelsLike) {
                        ForEach(0..<typesOfPain.count) {
                            Text("\(self.typesOfPain[$0])")
                        }
                    }
                }
                
                Section(header: Text("How often does it occur?")) {
                    Picker("", selection: $howOften) {
                        ForEach(0..<frequency.count) {
                            Text("\(self.frequency[$0])")
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("How does it impact your life?")) {
                    Toggle("Decreases my quality of life", isOn: $impactsLife)
                    Toggle("Impacts my job and/or productivity", isOn: $impactsJob)
                }
            }.navigationBarTitle("Add Symptom")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
