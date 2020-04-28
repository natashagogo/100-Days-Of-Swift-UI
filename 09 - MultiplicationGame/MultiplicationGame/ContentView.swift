//
//  ContentView.swift
//  MultiplicationGame
//
//  Created by Natasha Godwin on 4/28/20.
//  Copyright © 2020 Natasha Godwin. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State private var tableSelected = 3
    @State private var numberOfQuestions = 0
    
    let questions: [String] = [
           "5",
           "10",
           "15",
           "20",
           "All"
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Which tables do you wanna practice?")) {
                    Stepper(value: $tableSelected, in: 1...12) {
                      Text("\(tableSelected)")
                    }
                }
                Section(header: Text("How many questions?")) {
                    Picker("", selection: $numberOfQuestions) {
                        ForEach(0 ..< questions.count) {
                            Text("\(self.questions[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Let's Play!") {
                // add code
                
            })
        }
    }
}

struct Game: View {
    var body: some View {
        Text("Game")
    }
}

struct ContentView: View {
    @State private var isActive = false
    
    let settings = Settings()
    let game = Game()
    
    var body: some View {
        Group {
            settings
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
