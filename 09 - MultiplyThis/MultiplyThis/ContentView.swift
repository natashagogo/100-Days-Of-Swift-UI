//
//  ContentView.swift
//  MultiplyThis
//
//  Created by Natasha Godwin on 5/30/21.
//

import SwiftUI

/*
 
 This app needs ...
 
 - Two views (one for settings, the other for the game)
 - A way to select multiplication tables to practice (buttons, stepper)
 - A way to choose the number of questions (5, 10, 20, or “All”)
 - A randomly generated set of questions, within the parameters set by the user

 */

struct Game: View {
    var body: some View {
        Text("Let's Play!")
    }
}

struct Settings: View {
    @State private var tableSelected = 2
    @State private var questionNumber = 0 // index
    
    let numberOfQuestions = ["5", "10", "20", "All"]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Practice")) {
                    Stepper("\(tableSelected) Tables", value: $tableSelected, in: 1...12)
                }
                Section(header: Text("Number of Questions")) {
                    Picker("", selection: $questionNumber) {
                        ForEach(0..<numberOfQuestions.count) { number in
                            Text("\(numberOfQuestions[number])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        VStack {
            if isActive {
                Game()
            } else {
                Settings()
            }
            Button(action:  {
                self.isActive.toggle()
            }) {
                Text("\(isActive ? "Settings": "Play")")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
